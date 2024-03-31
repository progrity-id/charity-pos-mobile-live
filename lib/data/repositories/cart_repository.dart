import 'dart:async';

import '../../domain/entities/cart_entity.dart';

class CartRepository {
  final List<CartEntity> _listCart = [];

  final _controller = StreamController<List<CartEntity>>.broadcast();

  Stream<List<CartEntity>> get items => _controller.stream.asBroadcastStream();

  void addItem(CartEntity cartEntity) {
    int index = _listCart.indexWhere((element) => element.id == cartEntity.id);

    if (index < 0) {
      _listCart.add(cartEntity.copyWith(count: 1));
    } else {
      _listCart[index] =
          _listCart[index].copyWith(count: _listCart[index].count + 1);
    }

    _controller.sink.add(_listCart);
  }

  void addDecreasedItem(int idProduct) {
    int index = _listCart.indexWhere((element) => element.id == idProduct);

    int newCount = _listCart[index].count - 1;

    if (newCount < 1) {
      _listCart.removeAt(index);
    } else {
      _listCart[index] =
          _listCart[index].copyWith(count: _listCart[index].count - 1);
    }

    _controller.sink.add(_listCart);
  }

  Future<List<CartEntity>> getCart() async {
    return _listCart;
  }
}
