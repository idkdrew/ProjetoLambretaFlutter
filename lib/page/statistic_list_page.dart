import 'package:flutter/material.dart';

import '../widget/custom_widgets.dart';

import '../controller/player_controller.dart';
import '../controller/statistic_controller.dart';
import '../model/player.dart';
import '../model/statistic.dart';

class StatisticListPage extends StatefulWidget {
  @override
  _StatisticListPage createState() => _StatisticListPage();
}

class _StatisticListPage extends State<StatisticListPage> {
  final PlayerController playerController = PlayerController();
  final StatisticController statisticController = StatisticController();
  List<Player> players = [];
  Map<int, int> appearances = {};
  Map<int, int> goals = {};
  Map<int, int> assists = {};

  @override
  void initState() {
    super.initState();
    fetchPlayersAndStatistics();
  }

  void fetchPlayersAndStatistics() {
    setState(() {
      players = playerController.fetchPlayers();
      players.forEach((player){
        List<Statistic> statistics = statisticController.fetchStatisticsByPlayer(player.id);
        appearances[player.id] = statistics.length;
        goals[player.id] = statistics.fold(0, (goals, statistic) => goals + statistic.goal);
        assists[player.id] = statistics.fold(0, (assists, statistic) => assists + statistic.assist);
      });
    });
  }

  void navigateToPlayer(int id) {
    PlayerController.playerSelected = id;
    Navigator.pushNamed(context, '/team/player/view');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Estatistícas",
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
            CustomTitle(text: 'Estatistícas'),
            CustomSizedBox(),
            Expanded(
              child: ListView.builder(
                  itemCount: players.length,
                  itemBuilder: (context, index) {
                    final player = players[index];
                    return StatisticCard(
                        name: player.name,
                        position: player.position,
                        appearances: appearances[player.id] ?? 0,
                        goals: goals[player.id] ?? 0,
                        assists: assists[player.id] ?? 0,
                        onTap: () {
                          navigateToPlayer(player.id);
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
