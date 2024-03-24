import 'package:dio/dio.dart';

import '../../domain/entities/login_params.dart';
import '../models/login_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> postLogin(LoginParams params);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<LoginResponseModel> postLogin(LoginParams params) async {
    final result = await _dio.post("api/login", data: params.toMap());

    return LoginResponseModel.fromJson(result.data);
  }
}
