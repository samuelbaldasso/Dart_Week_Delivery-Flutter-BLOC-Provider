import 'package:dw_delivery_flutter/app/core/ui/base_state/helpers/size_extension.dart';
import 'package:dw_delivery_flutter/app/core/ui/styles/app_styles.dart';
import 'package:dw_delivery_flutter/app/core/ui/styles/colors.dart';
import 'package:dw_delivery_flutter/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Color(0xff140e0e),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.percentHeight(.30),
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  DeliveryButton(
                    label: 'ACESSAR',
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/home');
                    },
                    width: context.percentWidth(.6),
                    height: 35,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
