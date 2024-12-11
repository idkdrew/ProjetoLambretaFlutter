import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/custom_widgets.dart';
import '../controller/team_controller.dart';

class TeamFormPage extends StatefulWidget {
  @override
  _TeamFormPage createState() => _TeamFormPage();
}

class _TeamFormPage extends State<TeamFormPage> {
  final TeamController teamController = TeamController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController urlImageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = "";
    urlImageController.text = "";
  }

  void create() async {
    if(nameController.text.isEmpty || urlImageController.text.isEmpty){
      CustomSnackBarError.show(context, "Preencha todos os campos!");
      return;
    }

    try {
      await teamController.createTeam(nameController.text, urlImageController.text);
      CustomSnackBarSucess.show(context, "Carreira adicionada!");

      setState(() {});
      Navigator.of(context).pop(true);
    } catch (e) {
      CustomSnackBarError.show(context, "Erro ao adicionar carreira!");
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut().then((user) => {
      Navigator.pushReplacementNamed(context, '/'),
      CustomSnackBarSucess.show(context, "Saindo!")
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Nova Carreira",
        onLogout: logout,
      ),
      backgroundColor: const Color(0xFFE0E0E0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomSizedBox(),
            CustomInput(
                label: 'Nome',
                controller: nameController
            ),
            CustomSizedBox(),
            CustomInput(
                label: 'Url da Imagem',
                controller: urlImageController
            ),
            CustomSizedBox(),
            CustomButton(
              text: 'Criar Carreira',
              onPressed: create,
            ),
          ],
        ),
      ),
    );
  }
}
