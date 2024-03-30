part of 'dashboard_bloc.dart';

enum DashboardStatus { idle, loading, success, failure }

class DashboardState extends Equatable {
  final List<CategoryEntity> listCategory;
  final List<ProductEntity> listProduct;
  final String idCategorySelected;
  final DashboardStatus status;

  const DashboardState({
    this.listCategory = const [],
    this.listProduct = const [],
    this.idCategorySelected = "",
    this.status = DashboardStatus.idle,
  });

  DashboardState copyWith({
    List<CategoryEntity>? listCategory,
    List<ProductEntity>? listProduct,
    String? idCategorySelected,
    DashboardStatus? status,
  }) {
    return DashboardState(
      listCategory: listCategory ?? this.listCategory,
      listProduct: listProduct ?? this.listProduct,
      idCategorySelected: idCategorySelected ?? this.idCategorySelected,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        listCategory,
        listProduct,
        idCategorySelected,
        status,
      ];
}
