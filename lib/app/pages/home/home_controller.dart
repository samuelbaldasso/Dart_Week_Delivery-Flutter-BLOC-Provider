import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dw_delivery_flutter/app/dto/order_product_dto.dart';
import 'package:dw_delivery_flutter/app/pages/home/home_state.dart';
import 'package:dw_delivery_flutter/app/repositories/products/products_repo.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepo _repository;

  HomeController(this._repository) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final products = await _repository.findAllProducts();
      emit(state.copyWith(status: HomeStatus.success, products: products));
    } catch (e, s) {
      log("Erro ao buscar produtos.", error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStatus.error, errorMessage: "Erro ao buscar produtos."));
    }
  }

  void addOrUpdateBag(OrderProductDto orderProduct) {
    final shoppingBag = [...state.shoppingBag];

    final orderIndex = shoppingBag
        .indexWhere((order) => order.product == orderProduct.product);
    if (orderIndex > -1) {
      if (orderProduct.amount == 0) {
        shoppingBag.removeAt(orderIndex);
      } else {
        shoppingBag[orderIndex] = orderProduct;
      }
    } else {
      shoppingBag.add(orderProduct);
    }
    emit(state.copyWith(shoppingBag: shoppingBag));
  }
}
