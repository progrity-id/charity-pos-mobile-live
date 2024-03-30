part of 'cart_home_bloc.dart';

abstract class CartHomeEvent extends Equatable {
  const CartHomeEvent();
}

class CartHomeStarted extends CartHomeEvent {
  @override
  List<Object?> get props => [];
}

class CartHomeUpdated extends CartHomeEvent {
  final List<CartEntity> listCart;
  final int totalPrice;

  const CartHomeUpdated({
    required this.listCart,
    required this.totalPrice,
  });

  @override
  List<Object> get props => [listCart, totalPrice];
}
