import 'package:flutter/material.dart';

import '../widget/custom_widgets.dart';

import '../controller/player_controller.dart';
import '../controller/statistic_controller.dart';
import '../model/player.dart';
import '../model/statistic.dart';

class PlayerPage extends StatefulWidget {
  @override
  _PlayerPage createState() => _PlayerPage();
}

class _PlayerPage extends State<PlayerPage> {
  final PlayerController playerController = PlayerController();
  final StatisticController statisticController = StatisticController();
  Player? player;
  int appearances = 0;
  int goals = 0;
  int assists = 0;
  int contribuitions = 0;
  double goalsPerAppearances = 0;
  double assistsPerAppearances = 0;
  double contribuitionsPerAppearances = 0;



  @override
  void initState() {
    super.initState();
    fetchPlayerAndStatistics();
  }

  void fetchPlayerAndStatistics() {
    setState(() {
      player = playerController.getPlayerSelected();
      List<Statistic> statistics = statisticController.fetchStatisticsByPlayer(player!.id);
      appearances = statistics.length;
      goals = statistics.fold(0, (goals, statistic) => goals + statistic.goal);
      assists = statistics.fold(0, (assists, statistic) => assists + statistic.assist);

      contribuitions = goals + assists;
      if(appearances>0){
        goalsPerAppearances = goals / appearances;
        assistsPerAppearances = assists / appearances;
        contribuitionsPerAppearances = contribuitions / appearances;
      }else{
        goalsPerAppearances = 0;
        assistsPerAppearances = 0;
        contribuitionsPerAppearances = 0;
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Estatistícas do Jogador",
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
            Row(
              children: [
                CustomTitle(text: player!.name),
                const Spacer(),
                CustomTitle(text: player!.position),
              ],
            ),
            CustomSizedBox(),
            CustomTitle(text: "$appearances J"),
            CustomSizedBox(),
            Row(
              children: [
                CustomTitle(text: "$goals G"),
                const Spacer(),
                CustomTitle(text: "$goalsPerAppearances G/J"),
              ],
            ),
            CustomSizedBox(),
            Row(
              children: [
                CustomTitle(text: "$assists A"),
                const Spacer(),
                CustomTitle(text: "$assists A/J"),
              ],
            ),
            CustomSizedBox(),
            Row(
              children: [
                CustomTitle(text: "$contribuitions GA"),
                const Spacer(),
                CustomTitle(text: "$contribuitionsPerAppearances GA/J"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
