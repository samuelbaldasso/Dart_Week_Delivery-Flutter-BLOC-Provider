import 'package:dw_delivery_flutter/app/pages/order/order_controller.dart';
import 'package:dw_delivery_flutter/app/pages/order/order_page.dart';
import 'package:dw_delivery_flutter/app/repositories/payment_types/impl_payment_types_repo.dart';
import 'package:dw_delivery_flutter/app/repositories/payment_types/payment_types_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderRouter {
  OrderRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<PaymentTypesRepo>(
            create: (context) => PaymentTypesRepoImpl(
              dio: context.read(),
            ),
          ),
          Provider(
            create: (context) => OrderController(repo: context.read()),
          ),
        ],
        child: const OrderPage(),
      );
}
