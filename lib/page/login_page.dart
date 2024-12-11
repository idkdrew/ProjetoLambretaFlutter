import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/custom_widgets.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginController.text = "";
    passwordController.text = "";
  }

  void loginFireBase() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginController.text,
        password: passwordController.text,
      );
      Navigator.pushReplacementNamed(context, '/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomSnackBarError.show(context, "Usuário não encontrado!");
      } else if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
        CustomSnackBarError.show(context, "Credenciais Incorretas!");
      } else if (e.code == 'invalid-email') {
        CustomSnackBarError.show(context, "E-mail inválido!");
      }
    } catch (e) {
      CustomSnackBarError.show(context, "Erro ao tentar fazer login.");
    }
  }

  void navigateToCreateUser() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLoginAppBar(title: "Lambreta"),
      backgroundColor: const Color(0xFFE0E0E0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSizedBox(),
              CustomInput(label: 'E-Mail', controller: loginController),
              CustomSizedBox(),
              CustomInput(
                  label: 'Senha',
                  obscure: true,
                  controller: passwordController),
              CustomSizedBox(),
              CustomButton(
                text: 'Entrar',
                onPressed: loginFireBase,
              ),
              CustomSizedBox(),
              CustomButton(
                text: 'Não tenho Conta',
                onPressed: navigateToCreateUser,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
