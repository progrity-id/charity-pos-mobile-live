import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/cart_repository.dart';
import '../../../data/repositories/transaction_repository.dart';
import '../../../domain/entities/cart_entity.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final TransactionRepository _transactionRepository;
  final CartRepository _cartRepository;

  CartBloc(
    this._transactionRepository,
    this._cartRepository,
  ) : super(const CartState()) {
    on<CartStarted>(_onCartStarted);
  }

  FutureOr<void> _onCartStarted(CartStarted event, emit) async {
    emit(state.copyWith(status: CartStatus.loading));

    final resInv = await _transactionRepository.genInvoice();

    resInv.fold((l) => null, (r) {
      emit(state.copyWith(invoice: r));
    });

    final resCart = await _cartRepository.getCart();

    final totalPrice = await calculatePrice(resCart);

    emit(
      state.copyWith(
        listCart: resCart,
        totalPrice: totalPrice,
        status: CartStatus.success,
      ),
    );
  }

  Future<int> calculatePrice(List<CartEntity> cart) async {
    int totalPrice = 0;
    for (var element in cart) {
      totalPrice += element.harga * element.count;
    }

    return totalPrice;
  }
}
