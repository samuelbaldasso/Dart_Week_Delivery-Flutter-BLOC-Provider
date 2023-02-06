import 'package:dw_delivery_flutter/app/core/config/rest_client/dio_app.dart';
import 'package:dw_delivery_flutter/app/repositories/auth/auth_repository_impl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AppBindings extends StatelessWidget {
  const AppBindings({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CustomDio(),
        ),
        Provider(
          create: (context) => AuthRepositoryImpl(dio: context.read()),
        )
      ],
      child: child,
    );
  }
}
