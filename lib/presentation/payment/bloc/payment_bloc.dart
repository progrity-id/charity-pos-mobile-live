import 'dart:async';

import 'package:charity_cashier/data/mappers/cart_mapper.dart';
import 'package:charity_cashier/data/repositories/transaction_repository.dart';
import 'package:charity_cashier/domain/entities/transaction_params.dart';
import 'package:charity_cashier/domain/usecases/get_user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/cart_repository.dart';
import '../../../domain/entities/cart_entity.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final CartRepository _cartRepository;
  final TransactionRepository _transactionRepository;
  final GetUserUseCase _getUserUseCase;

  PaymentBloc(
    this._cartRepository,
    this._transactionRepository,
    this._getUserUseCase,
  ) : super(const PaymentState()) {
    on<PaymentStarted>(_onPaymentStarted);
    on<PaymentNominalChanged>(_onPaymentNominalChanged);
    on<PaymentAccepted>(_onPaymentAccepted);
  }

  FutureOr<void> _onPaymentStarted(PaymentStarted event, emit) async {
    emit(state.copyWith(status: PaymentStatus.loading));

    final cart = await _cartRepository.getCart();
    final totalOrder = await calculatePrice(cart);

    final nearestTotal = getNearestNumber(totalOrder);
    final listSuggest = genSuggest(nearestTotal);

    emit(
      state.copyWith(
        listCart: cart,
        totalOrder: totalOrder,
        totalPayment: totalOrder,
        suggestPayment: listSuggest,
        status: PaymentStatus.success,
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

  int getNearestNumber(int number) {
    // Menghitung faktor pembulatan

    String factor = "1";
    for (var a = 0; a < number.toString().length - 1; a++) {
      factor += "0";
    }

    int factorInt = int.parse(factor);

    // Membulatkan nilai dengan faktor pembulatan
    return (number / factorInt).round() * factorInt;
  }

  List<int> genSuggest(int nearest) {
    int l = nearest.toString().length;
    List<int> suggest = [nearest];
    for (var a = 0; a < 3; a++) {
      String angka = "";
      if (a == 0) {
        angka = "5";
      } else if (a == 1) {
        angka = "10";
      } else {
        angka = "20";
      }

      for (var i = 0; i < l - 2; i++) {
        angka += "0";
      }
      int angkaInt = int.parse(angka);
      suggest.add(nearest + angkaInt);
    }

    return suggest;
  }

  FutureOr<void> _onPaymentNominalChanged(
      PaymentNominalChanged event, Emitter<PaymentState> emit) async {
    emit(state.copyWith(totalPayment: event.nominal));
  }

  FutureOr<void> _onPaymentAccepted(
      PaymentAccepted event, Emitter<PaymentState> emit) async {
    emit(state.copyWith(status: PaymentStatus.loadingDialog));

    final inv = await _transactionRepository.getInvoice();

    final now = DateTime.now();

    // "2024/05/15",
    final tgl =
        "${now.year}/${now.month.toString().padLeft(2, "0")}/${now.day.toString().padLeft(2, "0")}";

    final user = await _getUserUseCase();

    final params = TransactionParams(
      inv: inv,
      status: "Proses",
      tanggal: tgl,
      total: state.totalOrder,
      tax: 0,
      idUsers: user.id,
      details:
          state.listCart.map((e) => e.toDetailTransactionParams()).toList(),
    );

    final res = await _transactionRepository.createTransaction(params);

    res.fold(
      (l) => emit(state.copyWith(
        status: PaymentStatus.failureCreate,
      )),
      (r) {
        _cartRepository.resetCart();
        emit(
          state.copyWith(
            status: PaymentStatus.successCreate,
          ),
        );
      },
    );
  }
}
