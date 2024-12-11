import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/custom_widgets.dart';

import '../controller/user_controller.dart';

class RegisterUserPage extends StatefulWidget {
  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final UserController userController = UserController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginController.text = "";
    passwordController.text = "";
  }



  void registerFireBase() async {
    if (loginController.text.isEmpty || passwordController.text.isEmpty) {
      CustomSnackBarError.show(context, "Preencha todos os campos!");
    } else {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: loginController.text, password: passwordController.text);
        Navigator.pushReplacementNamed(context, '/');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-email') {
          CustomSnackBarError.show(context, "E-mail inválido!");
        }else  if (e.code == 'email-already-in-use') {
          CustomSnackBarError.show(context, "Usuário Existente!");
        }else if (e.code == 'weak-password') {
          CustomSnackBarError.show(
              context, "Senha muito curta, no mínimo 6 caracteres!");
        }
      } catch (e) {
        CustomSnackBarError.show(context, "Erro ao tentar fazer login.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLoginAppBar(title: "Cadastrar Usuário"),
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
                  obscure: true,
                  label: 'Senha',
                  controller: passwordController),
              CustomSizedBox(),
              CustomButton(
                text: 'Cadastrar Usuário',
                onPressed: registerFireBase,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
