import 'dart:async';

import 'package:charity_cashier/data/repositories/product_repository.dart';
import 'package:charity_cashier/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/category_repository.dart';
import '../../../domain/entities/category_entity.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;

  DashboardBloc(this._categoryRepository, this._productRepository)
      : super(const DashboardState()) {
    on<DashboardStarted>(_onDashboardStarted);
  }

  FutureOr<void> _onDashboardStarted(DashboardStarted event, emit) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    final res = await _categoryRepository.getCategory();

    res.fold(
      (l) => null,
      (r) => emit(
        state.copyWith(
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
  }
}
