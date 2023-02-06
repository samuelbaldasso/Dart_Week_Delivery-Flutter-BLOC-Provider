import 'package:dw_delivery_flutter/app/models/payment_types_model.dart';

abstract class PaymentTypesRepo {
  Future<List<PaymentTypesModel>> getAllTypes();
}
