import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memobelc_front/src/core/core.dart';
import 'package:memobelc_front/src/modules/auth/presenter/stores/auth_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool rememberMe = false;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final authStore = Modular.get<AuthStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage(AppImages.logoPNG),
                width: 200,
                height: 200,
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.tertiary,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.tertiary,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              obscureText: _obscureText,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  Checkbox(
                      value: rememberMe,
                      onChanged: (newBool) {
                        setState(() => rememberMe = !rememberMe);
                      }),
                  const Text('Lembrar de mim'),
                ]),
                TextButton(
                  onPressed: () {
                    Modular.to.navigate('/forgot-password');
                  },
                  child: const Text('Esqueceu a senha?'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            FilledButton(
              onPressed: () async {
                if (await authStore.login(
                    usernameController.text, passwordController.text)) {
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text("E-mail ou senha inválidos"),
                      behavior: SnackBarBehavior.floating));
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 22.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Não tem uma conta ainda?"),
                TextButton(
                  onPressed: () {
                    Modular.to.navigate('/register');
                  },
                  child: const Text('Crie agora!'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
