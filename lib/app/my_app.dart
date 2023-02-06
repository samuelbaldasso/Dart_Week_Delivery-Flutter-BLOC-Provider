import 'package:dw_delivery_flutter/app/core/theme/theme_config.dart';
import 'package:dw_delivery_flutter/app/pages/auth/register/register_router.dart';
import 'package:dw_delivery_flutter/app/pages/home/home_router.dart';
import 'package:dw_delivery_flutter/app/pages/order/order_router.dart';
import 'package:dw_delivery_flutter/app/pages/product_details/product_details_router.dart';
import 'package:dw_delivery_flutter/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'core/bindings/app_bindings.dart';
import 'pages/auth/login/login_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBindings(
      child: MaterialApp(
        title: 'Delivery App',
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/product_details': (context) => ProductDetailsRouter.page,
          '/auth/login': (context) => LoginRouter.page,
          '/auth/register': (context) => RegisterRouter.page,
          '/order': (context) => OrderRouter.page,
        },
        theme: ThemeConfig.theme,
      ),
    );
  }
}
