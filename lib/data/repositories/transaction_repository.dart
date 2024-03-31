import 'package:charity_cashier/common/constants/app_error.dart';
import 'package:charity_cashier/data/datasources/transaction_remote_data_source.dart';
import 'package:charity_cashier/domain/entities/transaction_params.dart';
import 'package:dartz/dartz.dart';

class TransactionRepository {
  final TransactionRemoteDataSource _remoteDataSource;

  TransactionRepository(this._remoteDataSource);

  String _invoice = "";

  Future<Either<AppError, String>> genInvoice() async {
    try {
      final result = await _remoteDataSource.getTransaction();
      int transactionCount = result.data?.length ?? 0;
      final now = DateTime.now();

      _invoice =
          "INV-${now.day}${now.month}${now.year}-${(transactionCount + 1).toString().padLeft(3, '0')}";

      return Right(_invoice);
    } catch (e) {
      return const Left(AppError("Error"));
    }
  }

  Future<String> getInvoice() async {
    return _invoice;
  }

  Future<Either<AppError, bool>> createTransaction(
    TransactionParams params,
  ) async {
    try {
      await _remoteDataSource.createTransaction(params);

      return const Right(true);
    } catch (e) {
      print("err");
      print(e);
      return const Left(AppError("Error"));
    }
  }
}
