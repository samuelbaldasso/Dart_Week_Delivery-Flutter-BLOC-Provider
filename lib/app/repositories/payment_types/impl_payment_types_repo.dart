import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dw_delivery_flutter/app/core/config/rest_client/dio_app.dart';
import 'package:dw_delivery_flutter/app/core/exceptions/repository_exception.dart';
import 'package:dw_delivery_flutter/app/models/payment_types_model.dart';

import './payment_types_repo.dart';

class PaymentTypesRepoImpl implements PaymentTypesRepo {
  final CustomDio dio;

  PaymentTypesRepoImpl({required this.dio});

  @override
  Future<List<PaymentTypesModel>> getAllTypes() async {
    try {
      final result = await dio.auth().get('/payment-types');
      final resultData = result.data
          .map<PaymentTypesModel>((p) => PaymentTypesModel.fromMap(p))
          .toList();
      return resultData;
    } on DioError catch (e, s) {
      log('Erro ao buscar formas de pagamento', error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar formas de pagamento");
    }
  }
}
