import 'package:flutter/material.dart';

import '../model/player.dart';
import '../widget/custom_widgets.dart';

import '../controller/result_controller.dart';
import '../controller/player_controller.dart';
import '../controller/statistic_controller.dart';

class ResultFormPage extends StatefulWidget {
  @override
  _ResultFormPage createState() => _ResultFormPage();
}

class _ResultFormPage extends State<ResultFormPage> {
  final ResultController resultController = ResultController();
  final PlayerController playerController = PlayerController();
  final StatisticController statisticController = StatisticController();

  final List<String> options = ['Casa', 'Visitante'];
  final List<bool> selectedOption = <bool>[true, false];
  bool isHome = true;

  final TextEditingController homeGoalController = TextEditingController();
  final TextEditingController awayGoalController = TextEditingController();

  List<Player> players = [];
  Map<int, int> playerGoals = {};
  Map<int, int> playerAssists = {};

  @override
  void initState() {
    super.initState();
    isHome = true;
    homeGoalController.text = "";
    awayGoalController.text = "";
    fetchPlayers();
  }

  void fetchPlayers() {
    setState(() {
      players = playerController.fetchPlayers();
      for (var player in players) {
        playerGoals[player.id] = 0;
        playerAssists[player.id] = 0;
      }
    });
  }

  void updatePlayerGoal(int idPlayer, int goal) {
    setState(() {
      playerGoals[idPlayer] = goal;
    });
  }

  void updatePlayerAssist(int idPlayer, int assist) {
    setState(() {
      playerAssists[idPlayer] = assist;
    });
  }

  void create() {
    if (homeGoalController.text.isEmpty || awayGoalController.text.isEmpty) {
      CustomSnackBarError.show(context, "Preencha todos os campos!");
    }
    resultController.createResult(isHome, 0, int.parse(homeGoalController.text), int.parse(awayGoalController.text));
    players.forEach((player){
      statisticController.createStatistic(resultController.getLastId(), player.id, playerGoals[player.id] ?? 0, playerAssists[player.id] ?? 0);
    });
    CustomSnackBarSucess.show(context, "Resultado adicionado!");
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Novo Resultado",
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
            Center(
              child: ToggleButtons(
                direction: Axis.horizontal,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < selectedOption.length; i++) {
                      selectedOption[i] = i == index;
                      isHome = i == 0;
                    }
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                selectedBorderColor: Color(0xFF3366CC),
                selectedColor: Color(0xFFCCE5FF),
                fillColor: Color(0xFF3366CC),
                color: Color(0xFF3366CC),
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 80.0,
                ),
                isSelected: selectedOption,
                children: options.map((option) {
                  return Text(option);
                }).toList(),
              ),
            ),
            CustomSizedBox(),
            CustomInput(
                label: 'Gols da Casa',
                keyboardType: TextInputType.number,
                controller: homeGoalController),
            CustomSizedBox(),
            CustomInput(
                label: 'Gols do Visitante',
                keyboardType: TextInputType.number,
                controller: awayGoalController),
            CustomSizedBox(),
            Expanded(
              child: ListView.builder(
                itemCount: players.length,
                itemBuilder: (context, index) {
                  final player = players[index];
                  return ResultPlayerCard(
                    name: player.name,
                    position: player.position,
                    onGoalChanged: (goal) {
                      updatePlayerGoal(player.id, goal);
                    },
                    onAssistChanged: (assist) {
                      updatePlayerAssist(player.id, assist);
                    },
                  );
                },
              ),
            ),
            CustomSizedBox(),
            CustomButton(
              text: 'Adicionar Resultado',
              onPressed: create,
            ),
          ],
        ),
      ),
    );
  }
}
