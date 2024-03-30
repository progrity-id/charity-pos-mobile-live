part of 'cart_home_bloc.dart';

class CartHomeState extends Equatable {
  final List<CartEntity> listCart;
  final int totalPrice;

  const CartHomeState({
    this.listCart = const [],
    this.totalPrice = 0,
  });

  CartHomeState copyWith({
    List<CartEntity>? listCart,
    int? totalPrice,
  }) {
    return CartHomeState(
      listCart: listCart ?? this.listCart,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  List<Object> get props => [listCart, totalPrice];
}
