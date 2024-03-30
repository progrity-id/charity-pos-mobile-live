part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class DashboardStarted extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class DashboardProductAdded extends DashboardEvent {
  final ProductEntity productEntity;

  const DashboardProductAdded(this.productEntity);

  @override
  List<Object?> get props => [productEntity];
}

class DashboardProductDecreased extends DashboardEvent {
  final int idProduct;

  const DashboardProductDecreased(this.idProduct);

  @override
  List<Object?> get props => [idProduct];
}

class DashboardProductUpdated extends DashboardEvent {
  final List<ProductEntity> listProduct;

  const DashboardProductUpdated(this.listProduct);

  @override
  List<Object?> get props => [listProduct];
}
