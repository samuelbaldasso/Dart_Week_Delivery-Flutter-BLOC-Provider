import 'package:dw_delivery_flutter/app/pages/auth/login/login_controller.dart';
import 'package:dw_delivery_flutter/app/pages/auth/login/login_page.dart';
import 'package:dw_delivery_flutter/app/repositories/auth/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginRouter {
  LoginRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => LoginController(
              context.read<AuthRepositoryImpl>(),
            ),
          ),
        ],
        child: const LoginPage(),
      );
}
