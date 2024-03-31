part of 'payment_bloc.dart';

enum PaymentStatus {
  idle,
  success,
  loading,
  failure,
  loadingDialog,
  successCreate,
  failureCreate,
}

class PaymentState extends Equatable {
  final int totalOrder;
  final int totalPayment;
  final List<int> suggestPayment;
  final List<CartEntity> listCart;
  final PaymentStatus status;

  const PaymentState({
    this.totalOrder = 0,
    this.totalPayment = 0,
    this.suggestPayment = const [],
    this.listCart = const [],
    this.status = PaymentStatus.loading,
  });

  PaymentState copyWith({
    int? totalOrder,
    int? totalPayment,
    List<int>? suggestPayment,
    List<CartEntity>? listCart,
    PaymentStatus? status,
  }) {
    return PaymentState(
      totalOrder: totalOrder ?? this.totalOrder,
      totalPayment: totalPayment ?? this.totalPayment,
      suggestPayment: suggestPayment ?? this.suggestPayment,
      listCart: listCart ?? this.listCart,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        totalOrder,
        totalPayment,
        suggestPayment,
        listCart,
        status,
      ];
}
