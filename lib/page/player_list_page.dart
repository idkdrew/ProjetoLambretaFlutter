import 'package:firebase_auth/firebase_auth.dart';
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
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPlayers();
  }

  Future<void> fetchPlayers() async {
    if (!mounted) return;
    setState(() {
      isLoading = true;
    });
    try {
      final fetchPlayers = await playerController.fetchPlayers();
      if (mounted) {
        setState(() {
          players = fetchPlayers;
        });
      }
    } catch (e) {
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
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
        title: "Elenco",
        onLogout: logout,
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
