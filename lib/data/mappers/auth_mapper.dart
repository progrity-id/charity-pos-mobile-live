import '../../domain/entities/user_entity.dart';
import '../models/login_response_model.dart';

extension LoginResponseModelX on LoginResponseModel {
  UserEntity toUserEntity() {
    return UserEntity(
      id: data?.user?.id ?? 0,
      name: data?.user?.name ?? "",
      email: data?.user?.email ?? "",
    );
  }
}
