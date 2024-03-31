part of 'cart_bloc.dart';

enum CartStatus { idle, loading, success, failure }

class CartState extends Equatable {
  final String invoice;
  final List<CartEntity> listCart;
  final int totalPrice;
  final CartStatus status;

  const CartState({
    this.invoice = "",
    this.listCart = const [],
    this.totalPrice = 0,
    this.status = CartStatus.idle,
  });

  CartState copyWith({
    String? invoice,
    List<CartEntity>? listCart,
    int? totalPrice,
    CartStatus? status,
  }) {
    return CartState(
      invoice: invoice ?? this.invoice,
      listCart: listCart ?? this.listCart,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [invoice, listCart, totalPrice, status];
}
