import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memobelc_front/src/core/core.dart';
import 'package:memobelc_front/src/provider/shared_preferences.dart';
import 'package:memobelc_front/src/modules/auth/presenter/stores/auth_store.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isUser = false;
  final authStore = Modular.get<AuthStore>();

  @override
  void initState() {
    super.initState();
    _savedToken();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _navigateToLogin() {
    Future.delayed(const Duration(seconds: 3), () {
      if (isUser) {
        Modular.to.navigate('/dashboard/', arguments: authStore.currentUser);
      } else {
        Modular.to.pushReplacementNamed('/login');
      }
    });
  }

  void _savedToken() async {
    String? token = await getUserToken();
    if (token != null) {
      isUser = await authStore.refreshToken(token);
      _navigateToLogin();
    } else {
      _navigateToLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Center(
          child: Image(image: AssetImage(AppImages.logo)),
        ),
      ),
    );
  }
}
