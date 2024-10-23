import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memobelc_front/src/core/core.dart';
import 'package:memobelc_front/src/modules/auth/presenter/stores/auth_store.dart';

class VerificationCodePage extends StatefulWidget {
  final String? token;
  const VerificationCodePage({super.key, this.token});

  @override
  VerificationCodePageState createState() => VerificationCodePageState();
}

class VerificationCodePageState extends State<VerificationCodePage> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  final authStore = Modular.get<AuthStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 5) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        _focusNodes[index].unfocus();
      }
    }
  }

  void _submitCode() async {
    String code = _controllers.map((controller) => controller.text).join();

    if (code.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text("Codigo Incompleto!"),
          behavior: SnackBarBehavior.floating));
    }

    if (await authStore.sendCode(code, widget.token!)) {
      Modular.to.navigate('/dashboard/', arguments: authStore.currentUser);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text("Código inválido!"),
          behavior: SnackBarBehavior.floating));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () {
            Modular.to.navigate('/login');
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
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
            const Text(
              'Digite o código de 6 dígitos enviado ao seu e-mail:',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 40,
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: const InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => _onChanged(value, index),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: _submitCode,
              child: const Text('Verificar'),
            ),
          ],
        ),
      ),
    );
  }
}
