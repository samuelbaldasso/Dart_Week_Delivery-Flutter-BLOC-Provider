import 'package:dw_delivery_flutter/app/pages/product_details/product_details_controller.dart';
import 'package:dw_delivery_flutter/app/pages/product_details/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsRouter {
  ProductDetailsRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => ProductDetailsController(),
          ),
        ],
        builder: (context, child) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return ProductDetailsPage(
            product: args['product'],
            orderProductDto: args['order'],
          );
        },
      );
}
