import 'dart:developer';

import 'package:dw_delivery_flutter/app/dto/order_product_dto.dart';
import 'package:dw_delivery_flutter/app/pages/order/order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/payment_types/payment_types_repo.dart';

class OrderController extends Cubit<OrderState> {
  final PaymentTypesRepo _repo;
  OrderController({required PaymentTypesRepo repo})
      : _repo = repo,
        super(const OrderState.initial());

  Future<void> load(List<OrderProductDto> products) async {
    try {
      emit(state.copyWith(status: OrderStatus.loading));
      final paymentTypes = await _repo.getAllTypes();
      emit(state.copyWith(
        products: products,
        status: OrderStatus.loaded,
        model: paymentTypes,
      ));
    } catch (e, s) {
      log("Erro ao carregar página", error: e, stackTrace: s);
      emit(state.copyWith(
          status: OrderStatus.error, errorMessage: "Erro ao carregar página"));
    }
  }
}
