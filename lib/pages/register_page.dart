import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_chat/helpers/mostrar_alerta.dart';
import 'package:realtime_chat/services/auth_service.dart';
import 'package:realtime_chat/services/socket_service.dart';
import 'package:realtime_chat/widgets/blue_btn.dart';
import 'package:realtime_chat/widgets/custom_input.dart';
import 'package:realtime_chat/widgets/labels.dart';
import 'package:realtime_chat/widgets/logo.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Logo(title: 'Registro'),
                _Form(),
                Labels(
                  route: 'login',
                  title: 'Ya tienes cuenta?',
                  subtitles: 'Ingresa',
                ),
                Text('Términos y condiciones de uso.',
                    style: TextStyle(fontWeight: FontWeight.w200)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<_Form> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);

    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeHolder: 'Nombre',
            textEditingController: nameCtrl,
            keyboardType: TextInputType.text,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeHolder: 'Email',
            textEditingController: emailCtrl,
            isPassword: false,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeHolder: 'Contraseña',
            textEditingController: passCtrl,
            isPassword: true,
          ),
          BlueBtn(
            label: 'Crear cuenta',
            onTap: authService.autenticando
                ? null
                : () async {
                    final registroOk = await authService.register(
                        nameCtrl.text.trim(),
                        emailCtrl.text.trim(),
                        passCtrl.text.trim());
                    if (registroOk) {
                      socketService.connect();
                      Navigator.pushReplacementNamed(context, 'user');
                    } else {
                      mostrarAlerta(context, 'Registro incorrecto',
                          registroOk.toString());
                    }
                  },
          ),
        ],
      ),
    );
  }
}
