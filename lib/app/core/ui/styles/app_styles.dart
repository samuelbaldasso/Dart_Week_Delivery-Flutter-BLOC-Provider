import 'package:dw_delivery_flutter/app/core/ui/styles/colors.dart';
import 'package:dw_delivery_flutter/app/core/ui/styles/texts.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static AppStyle? _instance;
  // Avoid self isntance
  AppStyle._();
  static AppStyle get i {
    _instance ??= AppStyle._();
    return _instance!;
  }

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        backgroundColor: ColorsApp.i.primary,
        textStyle: Texts.i.textButtonLabel,
      );
}

extension AppStyles on BuildContext {
  AppStyle get appStyles => AppStyle.i;
}
