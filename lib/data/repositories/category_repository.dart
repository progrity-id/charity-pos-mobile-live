import 'package:charity_cashier/common/constants/app_error.dart';
import 'package:charity_cashier/data/datasources/category_remote_data_source.dart';
import 'package:charity_cashier/data/mappers/category_mapper.dart';
import 'package:charity_cashier/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';

class CategoryRepository {
  final CategoryRemoteDataSource _remoteDataSource;

  CategoryRepository(this._remoteDataSource);

  Future<Either<AppError, List<CategoryEntity>>> getCategory() async {
    try {
      final result = await _remoteDataSource.getCategory();

      return Right(result.data?.data?.map((e) => e.toDomain()).toList() ?? []);
    } catch (e) {
      return const Left(AppError("Error"));
    }
  }
}
