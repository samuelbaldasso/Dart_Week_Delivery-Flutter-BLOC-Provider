import 'dart:ui';

import 'package:flutter/material.dart';

class Texts {
  static Texts? _instance;
  // Avoid self isntance
  Texts._();
  static Texts get i {
    _instance ??= Texts._();
    return _instance!;
  }

  String get font => 'mplus1';

  TextStyle get textLight =>
      TextStyle(fontWeight: FontWeight.w300, fontFamily: font);

  TextStyle get textRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: font);

  TextStyle get textMedium =>
      TextStyle(fontWeight: FontWeight.w500, fontFamily: font);

  TextStyle get textSemiBold =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: font);

  TextStyle get textBold =>
      TextStyle(fontWeight: FontWeight.w700, fontFamily: font);

  TextStyle get textExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: font);

  TextStyle get textButtonLabel => textBold.copyWith(fontSize: 14);

  TextStyle get textTitle => textExtraBold.copyWith(fontSize: 28);
}

extension TextExtension on BuildContext {
  Texts get texts => Texts.i;
}
