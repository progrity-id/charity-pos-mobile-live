import 'package:dio/dio.dart';

import '../models/category_response_model.dart';

class CategoryRemoteDataSource {
  final Dio _dio;

  CategoryRemoteDataSource(this._dio);

  Future<CategoryResponseModel> getCategory() async {
    final result = await _dio.get("api/kategori");

    return CategoryResponseModel.fromJson(result.data);
  }
}
