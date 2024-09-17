import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memobelc_front/src/modules/auth/auth_module.dart';
import 'src/app_widget.dart';

void main() {
  runApp(ModularApp(module: AuthModule(), child: const AppWidget()));
}
