import 'package:dio/dio.dart';

import '../models/product_response_model.dart';

class ProductRemoteDataSource {
  final Dio _dio;

  ProductRemoteDataSource(this._dio);

  Future<ProductResponseModel> getProduct() async {
    final result =
        await _dio.get("api/produk", queryParameters: {"id_kategori": ""});

    return ProductResponseModel.fromJson(result.data);
  }
}
