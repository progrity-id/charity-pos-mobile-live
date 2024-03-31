import 'package:dio/dio.dart';

import '../../domain/entities/transaction_params.dart';
import '../models/transaction_response_model.dart';

class TransactionRemoteDataSource {
  final Dio _dio;

  TransactionRemoteDataSource(this._dio);

  Future<TransactionResponseModel> getTransaction() async {
    final result = await _dio
        .get("api/transaksi", queryParameters: {"list": true, "status": ""});

    return TransactionResponseModel.fromJson(result.data);
  }

  Future<bool> createTransaction(TransactionParams params) async {
    print("asdsd");
    print(params.toMap());

    await _dio.post("api/transaksi", data: params.toMap());

    return true;
  }
}
