import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mypetjoyy/core/api/api_client.dart';
import 'package:mypetjoyy/core/api/api_endpoints.dart';
import 'package:mypetjoyy/core/error/failures.dart';

import 'package:mypetjoyy/core/services/storage/secure_storage_service.dart';
import 'package:mypetjoyy/features/auth/data/models/auth_api_model.dart';
import 'package:mypetjoyy/features/auth/domain/entities/auth_entity.dart';

// Provider
final authRemoteDataSourceProvider = Provider<IAuthRemoteDataSource>((ref) {
  return AuthRemoteDataSource(
    apiClient: ref.read(apiClientProvider),
    secureStorage: ref.read(secureStorageProvider),
  );
});

abstract interface class IAuthRemoteDataSource {
  Future<Either<Failure, AuthEntity>> register({
    required String fullName,
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSource implements IAuthRemoteDataSource {
  final ApiClient _apiClient;
  final SecureStorageService _secureStorage;

  AuthRemoteDataSource({
    required ApiClient apiClient,
    required SecureStorageService secureStorage,
  }) : _apiClient = apiClient,
       _secureStorage = secureStorage;

  @override
  Future<Either<Failure, AuthEntity>> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.dio.post(
        ApiEndpoints.register,
        data: {'fullName': fullName, 'email': email, 'password': password},
      );

      final apiModel = AuthApiModel.fromJson(response.data);

      final token = response.data['token'] as String?;
      if (token != null) {
        await _secureStorage.saveToken(token);
      }

      return Right(apiModel.toEntity());
    } on DioException catch (e) {
      return Left(
        _handleDioException(e, defaultMessage: 'Registration failed'),
      );
    } catch (e) {
      return Left(
        ServerFailure(message: 'Unexpected error during registration: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.dio.post(
        ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );

      final apiModel = AuthApiModel.fromJson(response.data);

      final token = response.data['token'] as String?;
      if (token == null) {
        return const Left(
          ServerFailure(message: 'No authentication token received'),
        );
      }

      await _secureStorage.saveToken(token);

      return Right(apiModel.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e, defaultMessage: 'Login failed'));
    } catch (e) {
      return Left(ServerFailure(message: 'Unexpected error during login: $e'));
    }
  }

  Failure _handleDioException(
    DioException e, {
    required String defaultMessage,
  }) {
    String message = defaultMessage;

    if (e.response != null) {
      final data = e.response?.data;
      if (data is Map<String, dynamic> && data['message'] != null) {
        message = data['message'].toString();
      } else if (data is String) {
        message = data;
      }
    } else if (e.message != null) {
      message = e.message!;
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkFailure(
          message: 'Connection timeout - please check your internet',
        );
      case DioExceptionType.badResponse:
        if (e.response?.statusCode == 401) {
          _secureStorage.deleteToken(); 
          return AuthFailure(message: 'Invalid credentials');
        }
        return ServerFailure(message: message);
      default:
        return ServerFailure(message: message);
    }
  }
}
