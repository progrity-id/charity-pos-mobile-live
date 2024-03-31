import 'dart:async';

import 'package:charity_cashier/data/repositories/cart_repository.dart';
import 'package:charity_cashier/data/repositories/product_repository.dart';
import 'package:charity_cashier/domain/entities/cart_entity.dart';
import 'package:charity_cashier/domain/entities/product_entity.dart';
import 'package:charity_cashier/domain/entities/user_entity.dart';
import 'package:charity_cashier/domain/usecases/get_user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/category_repository.dart';
import '../../../domain/entities/category_entity.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;
  final CartRepository _cartRepository;
  final GetUserUseCase _getUserUseCase;

  late final StreamSubscription _subscription;

  DashboardBloc(
    this._categoryRepository,
    this._productRepository,
    this._cartRepository,
    this._getUserUseCase,
  ) : super(const DashboardState()) {
    on<DashboardStarted>(_onDashboardStarted);
    on<DashboardProductAdded>(_onDashboardProductAdded);
    on<DashboardProductUpdated>(_onDashboardProductUpdated);
    on<DashboardProductDecreased>(_onDashboardProductDecreased);
  }

  FutureOr<void> _onDashboardStarted(DashboardStarted event, emit) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    final user = await _getUserUseCase();

    final res = await _categoryRepository.getCategory();

    res.fold(
      (l) => null,
      (r) => emit(
        state.copyWith(
          user: user,
          listCategory: r,
        ),
      ),
    );

    final resProduct = await _productRepository.getProduct();

    resProduct.fold(
      (l) => null,
      (r) => emit(
        state.copyWith(
          listProduct: r,
          status: DashboardStatus.success,
        ),
      ),
    );

    _subscribe();
  }

  void _subscribe() {
    _subscription = _cartRepository.items.listen(
      (cart) {
        syncProduct(cart);
      },
    );
  }

  void syncProduct(List<CartEntity> cart) {
    final listProductTemp = [...state.listProduct];

    int counter = 0;
    for (var product in listProductTemp) {
      int index = cart.indexWhere((element) => element.id == product.id);

      if (index < 0) {
        if (product.isSelected) {
          listProductTemp[counter] = product.copyWith(
            isSelected: false,
            count: 0,
          );
        }
      } else {
        listProductTemp[counter] = product.copyWith(
          isSelected: true,
          count: cart[index].count,
        );
      }

      counter++;
    }

    add(DashboardProductUpdated(listProductTemp));
  }

  FutureOr<void> _onDashboardProductAdded(
      DashboardProductAdded event, Emitter<DashboardState> emit) {
    _cartRepository.addItem(
      CartEntity(
        id: event.productEntity.id,
        nama: event.productEntity.nama,
        gambar: event.productEntity.gambar,
        count: event.productEntity.count,
        harga: event.productEntity.harga,
      ),
    );
  }

  FutureOr<void> _onDashboardProductUpdated(
      DashboardProductUpdated event, Emitter<DashboardState> emit) {
    emit(state.copyWith(listProduct: event.listProduct));
  }

  FutureOr<void> _onDashboardProductDecreased(
      DashboardProductDecreased event, Emitter<DashboardState> emit) {
    _cartRepository.addDecreasedItem(event.idProduct);
  }
}
