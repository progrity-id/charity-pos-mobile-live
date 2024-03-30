import 'package:charity_cashier/domain/entities/category_entity.dart';

import '../models/category_response_model.dart';

extension DatumX on Datum {
  CategoryEntity toDomain() {
    return CategoryEntity(
      id: id ?? 0,
      nama: nama ?? "",
    );
  }
}
