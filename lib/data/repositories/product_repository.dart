import 'package:charity_cashier/common/constants/app_error.dart';
import 'package:charity_cashier/data/datasources/product_remote_data_source.dart';
import 'package:charity_cashier/data/mappers/product_mapper.dart';
import 'package:charity_cashier/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

class ProductRepository {
  final ProductRemoteDataSource _remoteDataSource;

  ProductRepository(this._remoteDataSource);

  Future<Either<AppError, List<ProductEntity>>> getProduct() async {
    try {
      final res = await _remoteDataSource.getProduct();

      return Right(res.data?.data?.map((e) => e.toDomain()).toList() ?? []);
    } catch (e) {
      return const Left(AppError("Error"));
    }
  }
}
