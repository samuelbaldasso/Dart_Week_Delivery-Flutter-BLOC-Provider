import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;
  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => Color(0xff007D21);
  Color get secondary => Color(0xffFF8B0C);
}

extension ColorExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
