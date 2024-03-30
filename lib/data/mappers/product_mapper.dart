import 'package:charity_cashier/data/models/product_response_model.dart';
import 'package:charity_cashier/domain/entities/product_entity.dart';

extension DatumX on Datum {
  ProductEntity toDomain() {
    return ProductEntity(
      id: id ?? 0,
      nama: nama ?? "",
      harga: int.parse(harga ?? "0"),
      gambar: gambar ?? "",
      count: 0,
      isSelected: false,
    );
  }
}
