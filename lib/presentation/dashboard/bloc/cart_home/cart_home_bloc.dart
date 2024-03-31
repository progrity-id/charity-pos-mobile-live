import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repositories/cart_repository.dart';
import '../../../../domain/entities/cart_entity.dart';

part 'cart_home_event.dart';
part 'cart_home_state.dart';

class CartHomeBloc extends Bloc<CartHomeEvent, CartHomeState> {
  final CartRepository _cartRepository;

  late final StreamSubscription _subscription;

  CartHomeBloc(this._cartRepository) : super(const CartHomeState()) {
    on<CartHomeStarted>(_onCartHomeStarted);
    on<CartHomeUpdated>(_onCartHomeUpdated);
  }

  @override
  Future<void> close() {
    _subscription.cancel();

    return super.close();
  }

  FutureOr<void> _onCartHomeStarted(CartHomeStarted event, emit) {
    _subscription = _cartRepository.items.listen((cart) {
      int total = 0;

      for (var element in cart) {
        total += element.count * element.harga;
      }

      add(CartHomeUpdated(listCart: cart, totalPrice: total));
    });
  }

  FutureOr<void> _onCartHomeUpdated(
      CartHomeUpdated event, Emitter<CartHomeState> emit) {
    emit(
        state.copyWith(listCart: event.listCart, totalPrice: event.totalPrice));
  }
}
