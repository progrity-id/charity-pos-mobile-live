import 'package:charity_cashier/domain/entities/user_entity.dart';

import '../repositories/auth_repository.dart';

class GetUserUseCase {
  final AuthRepository _repository;

  GetUserUseCase(this._repository);

  Future<UserEntity> call() {
    return _repository.getUser();
  }
}
