import 'package:flutter/material.dart';

import '../widget/custom_widgets.dart';

import '../controller/player_controller.dart';
import '../controller/statistic_controller.dart';
import '../controller/result_controller.dart';
import '../model/player.dart';
import '../model/statistic.dart';
import '../model/result.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPage createState() => _ResultPage();
}

class _ResultPage extends State<ResultPage> {
  final PlayerController playerController = PlayerController();
  final StatisticController statisticController = StatisticController();
  final ResultController resultController = ResultController();

  Result? result;
  List<Player> playersContribuitions = [];
  Map<int, Statistic> playerStatistics = {};
  String title = "";

  @override
  void initState() {
    super.initState();
    fetchResultandPlayerAndStatistics();
  }

  void fetchResultandPlayerAndStatistics() {
    setState(() {
      result = resultController.getResultSelected();
      if ((result!.isHome && result!.homeGoal > result!.awayGoal) ||
          (!result!.isHome && result!.awayGoal > result!.homeGoal)) {
        title = "Vitória";
      } else if ((result!.isHome && result!.homeGoal < result!.awayGoal) ||
          (!result!.isHome && result!.awayGoal < result!.homeGoal)) {
        title = "Derrota";
      } else {
        title = "Empate";
      }

      List<Statistic> statistics =
          statisticController.fetchStatisticsByResults(result!.id);
      Map<int, Player> players = Map.fromIterable(
        playerController.fetchPlayers(),
        key: (player) => player.id,
        value: (player) => player,
      );
      statistics.forEach((statistic) {
        if (statistic.assist > 0 || statistic.goal > 0) {
          playersContribuitions.add(players[statistic.idPlayer]!);
          playerStatistics[statistic.idPlayer] = statistic;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Resultado",
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
            CustomTitle(text: title),
            CustomSizedBox(),
            ResultCard(
                homeTeamLogo: "a",
                awayTeamLogo: "a",
                homeTeamGoal: result!.homeGoal,
                awayTeamGoal: result!.awayGoal,
                isHome: result!.isHome,
                onTap: () {}),
            CustomSizedBox(),
            Expanded(
              child: ListView.builder(
                  itemCount: playersContribuitions.length,
                  itemBuilder: (context, index) {
                    final player = playersContribuitions[index];
                    return ResultStatisticCard(
                        name: player.name,
                        position: player.position,
                        goals: playerStatistics[player.id]!.goal,
                        assists: playerStatistics[player.id]!.assist);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
