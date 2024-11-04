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

  void create() {
    if(nameController.text.isEmpty || urlImageController.text.isEmpty){
      CustomSnackBarError.show(context, "Preencha todos os campos!");
    }
      teamController.createTeam(nameController.text, urlImageController.text);
    CustomSnackBarSucess.show(context, "Carreira adicionada!");
      Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Nova Carreira",
        onLogout: () {
          Navigator.pushReplacementNamed(context, '/');
          CustomSnackBarSucess.show(context, "Saindo!");
        },
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
