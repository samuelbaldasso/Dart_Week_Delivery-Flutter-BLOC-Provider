import 'package:dw_delivery_flutter/app/core/ui/styles/colors.dart';
import 'package:dw_delivery_flutter/app/core/ui/styles/texts.dart';
import 'package:flutter/material.dart';

import '../ui/styles/app_styles.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _defaultInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: Colors.grey[400]!));

  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    // ignore: prefer_const_constructors
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    primaryColor: ColorsApp.i.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.i.primary,
      primary: ColorsApp.i.primary,
      secondary: ColorsApp.i.secondary,
    ),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: AppStyle.i.primaryButton),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        contentPadding: EdgeInsets.all(13),
        border: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        labelStyle: Texts.i.textRegular.copyWith(color: Colors.black),
        errorStyle: Texts.i.textRegular.copyWith(color: Colors.redAccent)),
  );
}
