part of 'dashboard_bloc.dart';

enum DashboardStatus { idle, loading, success, failure }

class DashboardState extends Equatable {
  final UserEntity? user;
  final List<CategoryEntity> listCategory;
  final List<ProductEntity> listProduct;
  final String idCategorySelected;
  final DashboardStatus status;

  const DashboardState({
    this.user,
    this.listCategory = const [],
    this.listProduct = const [],
    this.idCategorySelected = "",
    this.status = DashboardStatus.idle,
  });

  DashboardState copyWith({
    UserEntity? user,
    List<CategoryEntity>? listCategory,
    List<ProductEntity>? listProduct,
    String? idCategorySelected,
    DashboardStatus? status,
  }) {
    return DashboardState(
      user: user ?? this.user,
      listCategory: listCategory ?? this.listCategory,
      listProduct: listProduct ?? this.listProduct,
      idCategorySelected: idCategorySelected ?? this.idCategorySelected,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        user,
        listCategory,
        listProduct,
        idCategorySelected,
        status,
      ];
}
