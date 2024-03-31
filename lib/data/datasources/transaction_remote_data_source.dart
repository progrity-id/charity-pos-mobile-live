import 'package:dio/dio.dart';

import '../models/transaction_response_model.dart';

class TransactionRemoteDataSource {
  final Dio _dio;

  TransactionRemoteDataSource(this._dio);

  Future<TransactionResponseModel> getTransaction() async {
    final result = await _dio
        .get("api/transaksi", queryParameters: {"list": true, "status": ""});

    return TransactionResponseModel.fromJson(result.data);
  }
}
