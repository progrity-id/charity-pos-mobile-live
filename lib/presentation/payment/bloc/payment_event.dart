part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();
}

class PaymentStarted extends PaymentEvent {
  @override
  List<Object?> get props => [];
}

class PaymentNominalChanged extends PaymentEvent {
  final int nominal;

  const PaymentNominalChanged(this.nominal);

  @override
  List<Object?> get props => [nominal];
}

class PaymentAccepted extends PaymentEvent {
  @override
  List<Object?> get props => [];
}
