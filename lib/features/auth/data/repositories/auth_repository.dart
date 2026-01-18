// lib/features/auth/data/repositories/auth_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mypetjoyy/core/error/failures.dart';
import 'package:mypetjoyy/core/services/storage/secure_storage_service.dart';
import 'package:mypetjoyy/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:mypetjoyy/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:mypetjoyy/features/auth/data/models/auth_hive_model.dart';
import 'package:mypetjoyy/features/auth/domain/entities/auth_entity.dart';
import 'package:mypetjoyy/features/auth/domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRepositoryImpl(
    remote: ref.read(authRemoteDataSourceProvider),
    local: ref.read(authLocalDatasourceProvider),
    secureStorage: ref.read(secureStorageProvider),
  );
});

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthRemoteDataSource remote;
  final AuthLocalDatasource local;
  final SecureStorageService secureStorage;

  AuthRepositoryImpl({
    required this.remote,
    required this.local,
    required this.secureStorage,
  });

  @override
  Future<Either<Failure, bool>> register(AuthEntity entity) async {
    // 1. Try to register on the server first
    final remoteResult = await remote.register(
      fullName: entity.fullName,
      email: entity.email,
      password: entity.password ?? '',
    );

    return remoteResult.fold(
      // If remote fails → return error immediately (no point in saving locally)
      (failure) => Left(failure),

      // If remote succeeds → save to Hive for offline use
      (registeredUser) async {
        try {
          final hiveModel = AuthHiveModel.fromEntity(registeredUser);
          await local.register(hiveModel);
          return const Right(true);
        } catch (e) {
          // Local save failed but remote succeeded → still consider registration successful
          // You can log this error if you want
          return const Right(true);
        }
      },
    );
  }

  @override
  Future<Either<Failure, AuthEntity>> login(
    String email,
    String password,
  ) async {
    // 1. Attempt login on server
    final remoteResult = await remote.login(email: email, password: password);

    return remoteResult.fold(
      (failure) => Left(failure),

      // 2. On success → save/update local user data
      (loggedInUser) async {
        try {
          final hiveModel = AuthHiveModel.fromEntity(loggedInUser);
          await local.register(
            hiveModel,
          ); // reuse register method to save/update
          return Right(loggedInUser);
        } catch (e) {
          // Local save failed but login succeeded → still return success
          return Right(loggedInUser);
        }
      },
    );
  }

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() async {
    // Try local first (fast & works offline)
    final localUser = await local.getCurrentUser();

    if (localUser != null) {
      return Right(localUser.toEntity());
    }

    // If no local user → check if we have token and fetch from server
    // (you'll need to implement remote.getCurrentUser() later when you add /me endpoint)
    return const Left(
      LocalDatabaseFailure(message: 'No authenticated user found locally'),
    );
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      // 1. Clear secure token storage
      await secureStorage.deleteToken();

      // 2. Clear local user data
      final localSuccess = await local.logout();

      return Right(localSuccess);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: 'Logout failed: $e'));
    }
  }

  // Optional: Add this later when you implement protected routes
  // Future<Either<Failure, bool>> isAuthenticated() async {
  //   final token = await secureStorage.getToken();
  //   return Right(token != null);
  // }
}
