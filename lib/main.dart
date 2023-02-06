import 'package:dw_delivery_flutter/app/core/config/env/env.dart';
import 'package:flutter/material.dart';

import 'app/my_app.dart';

Future<void> main() async {
  await Env.i.load();
  runApp(const MyApp());
}
