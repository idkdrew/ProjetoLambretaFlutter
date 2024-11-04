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
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginController.text = "";
    passwordController.text = "";
    confirmPasswordController.text = "";
  }

  void register() {
    if(loginController.text.isEmpty || passwordController.text.isEmpty || confirmPasswordController.text.isEmpty){
      CustomSnackBarError.show(context, "Preencha todos os campos!");
    }
    if(passwordController.text == confirmPasswordController.text){
      bool create = userController.createUser(loginController.text, passwordController.text);
      if(create){
        CustomSnackBarSucess.show(context, "Usuário criado com sucesso!");
        Navigator.of(context).pop();
      }else{
        CustomSnackBarError.show(context, "Usuário Existente!");
      }
    }else{
      CustomSnackBarError.show(context, "As senhas não coincidem!");
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
              CustomInput(
                  label: 'Login',
                  controller: loginController
              ),
              CustomSizedBox(),
              CustomInput(
                obscure: true,
                  label: 'Senha',
                  controller: passwordController
              ),
              CustomSizedBox(),
              CustomInput(
                  obscure: true,
                  label: 'Confirmar Senha',
                  controller: confirmPasswordController
              ),
              CustomSizedBox(),
              CustomButton(
                text: 'Cadastrar Usuário',
                onPressed: register,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
