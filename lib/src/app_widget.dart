import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'TodoList',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(156, 41, 176, 1),
          secondary: Color.fromARGB(255, 102, 225, 241),
          tertiary: Color.fromRGBO(239, 228, 241, 1),
          onPrimary: Colors.white,
        ),
      ),
       routerConfig: Modular.routerConfig,
    ); //added by extension
    
  }
}

