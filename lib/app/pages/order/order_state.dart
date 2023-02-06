// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:dw_delivery_flutter/app/dto/order_product_dto.dart';
import 'package:dw_delivery_flutter/app/models/payment_types_model.dart';

part 'order_state.g.dart';

@match
enum OrderStatus {
  initial,
  loaded,
  loading,
  error,
}

class OrderState extends Equatable {
  final OrderStatus status;
  final List<OrderProductDto> products;
  final List<PaymentTypesModel> model;
  final String? errorMessage;

  const OrderState({
    required this.status,
    required this.products,
    required this.model,
    this.errorMessage,
  });

  const OrderState.initial()
      : status = OrderStatus.initial,
        products = const [],
        model = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, products, model, errorMessage];

  OrderState copyWith({
    OrderStatus? status,
    List<OrderProductDto>? products,
    List<PaymentTypesModel>? model,
    String? errorMessage,
  }) {
    return OrderState(
      status: status ?? this.status,
      products: products ?? this.products,
      model: model ?? this.model,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
