import 'package:dw_delivery_flutter/app/core/config/rest_client/dio_app.dart';
import 'package:dw_delivery_flutter/app/pages/home/home_controller.dart';
import 'package:dw_delivery_flutter/app/pages/home/home_page.dart';
import 'package:dw_delivery_flutter/app/repositories/products/products_repo.dart';
import 'package:dw_delivery_flutter/app/repositories/products/products_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepo>(
            create: (context) =>
                ProductsRepoImpl(dio: context.read<CustomDio>()),
          ),
          Provider(
            create: (context) => HomeController(context.read()),
          )
        ],
        child: const HomePage(),
      );
}
