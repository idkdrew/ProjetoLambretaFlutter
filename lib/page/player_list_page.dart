import 'package:flutter/material.dart';

import '../widget/custom_widgets.dart';

import '../controller/player_controller.dart';
import '../model/player.dart';

class PlayerListPage extends StatefulWidget {
  @override
  _PlayerListPage createState() => _PlayerListPage();
}

class _PlayerListPage extends State<PlayerListPage> {
  final PlayerController playerController = PlayerController();
  List<Player> players = [];

  @override
  void initState() {
    super.initState();
    fetchPlayers();
  }

  void fetchPlayers() {
    setState(() {
      players = playerController.fetchPlayers();
    });
  }

  void navigateToCreatePlayer() async {
    final result = await Navigator.pushNamed(context, '/team/player/create');
    if (result == true) {
      fetchPlayers();
    }
  }

  void navigateToPlayer(int id) {
    PlayerController.playerSelected = id;
    Navigator.pushNamed(context, '/team/player/view');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Elenco",
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
            CustomTitle(text: 'Elenco'),
            CustomSizedBox(),
            Expanded(
              child: ListView.builder(
                  itemCount: players.length,
                  itemBuilder: (context, index) {
                    final player = players[index];
                    return PlayerCard(
                        name: player.name,
                        position: player.position,
                        ovr: player.ovr,
                        onTap: () {
                          navigateToPlayer(player.id);
                        });
                  }),
            ),
            CustomSizedBox(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: CustomButton(
                text: 'Novo Jogador',
                onPressed: navigateToCreatePlayer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
