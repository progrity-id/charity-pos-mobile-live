import 'package:charity_cashier/common/constants/app_error.dart';
import 'package:charity_cashier/domain/entities/login_params.dart';
import 'package:charity_cashier/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<AppError, bool>> postLogin(LoginParams params);
  Future<Either<AppError, bool>> checkAuthentication();
  Future<UserEntity> getUser();
}
