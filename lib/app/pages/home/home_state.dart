// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:dw_delivery_flutter/app/dto/order_product_dto.dart';
import 'package:dw_delivery_flutter/app/models/product_model.dart';

part 'home_state.g.dart';

@match
enum HomeStatus { initial, loading, success, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<OrderProductDto> shoppingBag;

  const HomeState({
    required this.status,
    required this.products,
    this.errorMessage,
    required this.shoppingBag,
  });

  const HomeState.initial({
    this.status = HomeStatus.initial,
    this.products = const [],
    this.shoppingBag = const [],
    this.errorMessage,
  });
  // const HomeState(this.status);
  @override
  List<Object?> get props => [status, products, errorMessage, shoppingBag];

  HomeState copyWith({
    HomeStatus? status,
    List<ProductModel>? products,
    String? errorMessage,
    List<OrderProductDto>? shoppingBag,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      shoppingBag: shoppingBag ?? this.shoppingBag,
    );
  }
}
