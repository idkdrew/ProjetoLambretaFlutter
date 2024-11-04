import 'package:flutter/material.dart';

import '../widget/custom_widgets.dart';

import '../controller/user_controller.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UserController userController = UserController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginController.text = "";
    passwordController.text = "";
  }

  void login() {
      bool login = userController.login(loginController.text, passwordController.text);
      if(login){
        CustomSnackBarSucess.show(context, "Usuário logado com sucesso!");
        Navigator.pushReplacementNamed(context, '/team');
      }else{
        CustomSnackBarError.show(context, "Credenciais Incorretas!");
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
                CustomInput(
                    label: 'Login',
                    controller: loginController
                ),
                CustomSizedBox(),
                CustomInput(
                    label: 'Senha',
                    obscure: true,
                    controller: passwordController
                ),
                CustomSizedBox(),
                CustomButton(
                  text: 'Entrar',
                  onPressed: login,
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
