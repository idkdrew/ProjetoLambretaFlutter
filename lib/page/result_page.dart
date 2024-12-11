import 'package:firebase_auth/firebase_auth.dart';
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
  bool isLoading = true;
  Result? result;
  List<Player> playersContribuitions = [];
  Map<int, Statistic> playerStatistics = {};
  String title = "";

  @override
  void initState() {
    super.initState();
    fetchResultandPlayerAndStatistics();
  }

  Future<void> fetchResultandPlayerAndStatistics() async {
    if (!mounted) return;
    setState(() {
      isLoading = true;
    });
    try {
      final fetchPlayers = await playerController.fetchPlayers();
      final fetchResult = await resultController.getResultSelected();
      final fetchStatisticsByResults = await statisticController
          .fetchStatisticsByResults(ResultController.resultSelected);
      if (mounted) {
        setState(() {
          result = fetchResult;
          if ((result!.isHome && result!.homeGoal > result!.awayGoal) ||
              (!result!.isHome && result!.awayGoal > result!.homeGoal)) {
            title = "Vitória";
          } else if ((result!.isHome && result!.homeGoal < result!.awayGoal) ||
              (!result!.isHome && result!.awayGoal < result!.homeGoal)) {
            title = "Derrota";
          } else {
            title = "Empate";
          }

          List<Statistic> statistics = fetchStatisticsByResults;
          Map<int, Player> players = Map.fromIterable(
            fetchPlayers,
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
    } catch (e) {
      print("Erro ao carregar dados: $e");
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
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
        title: "Resultado",
        onLogout: logout,
      ),
      backgroundColor: const Color(0xFFE0E0E0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
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
