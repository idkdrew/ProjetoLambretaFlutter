
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/custom_widgets.dart';

import '../controller/player_controller.dart';


class PlayerFormPage extends StatefulWidget {
  @override
  _PlayerFormPage createState() => _PlayerFormPage();
}

class _PlayerFormPage extends State<PlayerFormPage> {
  final PlayerController playerController = PlayerController();
  final TextEditingController nameController = TextEditingController();

  final List<String> positions = [
    'GOL',
    'ZAG',
    'MEI',
    'ATA',
  ];

  String? selectedPosition;

  final TextEditingController ovrController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = "";
    ovrController.text = "";
  }

  void create() async {
    if(nameController.text.isEmpty || selectedPosition!.isEmpty || ovrController.text.isEmpty){
      CustomSnackBarError.show(context, "Preencha todos os campos!");
      return;
    }

    try {
      await playerController.createPlayer(nameController.text, selectedPosition!, int.parse(ovrController.text));
      CustomSnackBarSucess.show(context, "Jogador adicionado!");

      setState(() {});
      Navigator.of(context).pop(true);
    } catch (e) {
      CustomSnackBarError.show(context, "Erro ao adicionar jogador!");
    }
  }


  void logout() async {
    await FirebaseAuth.instance.signOut().then((user) => {
      CustomSnackBarError.show(context, "Saindo!"),
      Navigator.pushReplacementNamed(context, '/'),

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Novo Jogador",
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
            DropdownButtonFormField<String>(
              value: selectedPosition,
              items: positions.map((team) {
                return DropdownMenuItem(
                  value: team,
                  child: Text(team),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPosition = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Posição",
                labelStyle: TextStyle(color: const Color(0xFF3366CC)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(0xFF3366CC)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(0xFF3366CC)),
                ),
              ),
            ),
            CustomSizedBox(),
            CustomInput(
                label: 'Classificação',
                keyboardType: TextInputType.number,
                controller: ovrController
            ),
            CustomSizedBox(),
            CustomButton(
              text: 'Criar Jogador',
              onPressed: create,
            ),
          ],
        ),
      ),
    );
  }
}
