import 'package:dw_delivery_flutter/app/pages/auth/register/register_controller.dart';
import 'package:dw_delivery_flutter/app/pages/auth/register/register_page.dart';
import 'package:dw_delivery_flutter/app/repositories/auth/auth_repository.dart';
import 'package:dw_delivery_flutter/app/repositories/auth/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterRouter {
  RegisterRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => RegisterController(
              authRepository: context.read<AuthRepositoryImpl>(),
            ),
          )
        ],
        child: const RegisterPage(),
      );
}
