import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dw_delivery_flutter/app/core/config/rest_client/dio_app.dart';
import 'package:dw_delivery_flutter/app/models/product_model.dart';

import '../../core/exceptions/repository_exception.dart';
import './products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  final CustomDio dio;

  ProductsRepoImpl({required this.dio});

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unauth().get('/products');
      final resultData = result.data
          .map<ProductModel>((p) => ProductModel.fromMap(p))
          .toList();
      return resultData;
    } on DioError catch (e, s) {
      log('Erro ao buscar produtos.', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar produtos.');
    }
  }
}
