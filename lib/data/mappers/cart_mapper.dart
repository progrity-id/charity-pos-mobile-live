import '../../domain/entities/cart_entity.dart';
import '../../domain/entities/transaction_params.dart';

extension CartEntityX on CartEntity {
  DetailTransactionParams toDetailTransactionParams() {
    return DetailTransactionParams(
      idProduk: id,
      harga: harga,
      qty: count,
      total: harga * count,
    );
  }
}
