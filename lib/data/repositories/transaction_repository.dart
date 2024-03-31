import 'package:charity_cashier/common/constants/app_error.dart';
import 'package:charity_cashier/data/datasources/transaction_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class TransactionRepository {
  final TransactionRemoteDataSource _remoteDataSource;

  TransactionRepository(this._remoteDataSource);

  Future<Either<AppError, String>> genInvoice() async {
    try {
      final result = await _remoteDataSource.getTransaction();
      int transactionCount = result.data?.length ?? 0;
      final now = DateTime.now();

      return Right(
          "INV-${now.day}${now.month}${now.year}-${(transactionCount + 1).toString().padLeft(3, '0')}");
    } catch (e) {
      return const Left(AppError("Error"));
    }
  }
}
