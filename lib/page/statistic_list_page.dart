import 'package:firebase_auth/firebase_auth.dart';
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
  bool isLoading = true;

  List<Player> players = [];
  Map<int, int> appearances = {};
  Map<int, int> goals = {};
  Map<int, int> assists = {};

  @override
  void initState() {
    super.initState();
    fetchPlayersAndStatistics();
  }

  Future<void> fetchPlayersAndStatistics() async {
    if (!mounted) return;
    setState(() {
      isLoading = true;
    });

    try {
      final fetchPlayers = await playerController.fetchPlayers();

      if (fetchPlayers != null && fetchPlayers.isNotEmpty) {
        setState(() {
          players = fetchPlayers;
        });

        for (var player in players) {
          List<Statistic> statistics = await statisticController.fetchStatisticsByPlayer(player.id);

          appearances[player.id] = statistics.length;
          goals[player.id] = statistics.fold(0, (goals, statistic) => goals + statistic.goal);
          assists[player.id] = statistics.fold(0, (assists, statistic) => assists + statistic.assist);
        }
      } else {
        setState(() {
          players = []; // Caso não haja jogadores
        });
      }
    } catch (e) {
      CustomSnackBarError.show(context, "Erro ao carregar jogadores.");
      print("Erro ao carregar jogadores: $e");
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void navigateToPlayer(int id) {
    PlayerController.playerSelected = id;
    Navigator.pushNamed(context, '/team/player/view');
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
        title: "Estatistícas",
        onLogout: logout,
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
            isLoading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : players.isEmpty
                ? const Center(
              child: Text(
                "Nenhum jogador encontrado.",
                style: TextStyle(fontSize: 16),
              ),
            )
                : Expanded(
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
