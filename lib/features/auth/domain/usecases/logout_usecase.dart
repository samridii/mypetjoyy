import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mypetjoyy/core/error/failures.dart';
import 'package:mypetjoyy/core/usecases/app_usecase.dart';
import 'package:mypetjoyy/features/auth/data/repositories/auth_repository.dart';
import 'package:mypetjoyy/features/auth/domain/repositories/auth_repository.dart';

final logoutUsecaseProvider = Provider<LogoutUsecase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return LogoutUsecase(authRepository: authRepository);
});

class LogoutUsecase implements UseCaseWithoutParams<bool> {
  final IAuthRepository _authRepository;

  LogoutUsecase({required IAuthRepository authRepository})
    : _authRepository = authRepository;

  @override
  Future<Either<Failure, bool>> call() {
    return _authRepository.logout();
  }
}
