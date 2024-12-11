import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/custom_widgets.dart';

import '../controller/team_controller.dart';

class TeamOptionsPage extends StatefulWidget {
  @override
  _TeamOptionsPage createState() => _TeamOptionsPage();
}

class _TeamOptionsPage extends State<TeamOptionsPage> {
  final TeamController teamController = TeamController();

  @override
  void initState() {
    super.initState();
  }

  void navigateToPlayer() {
    Navigator.pushNamed(context, '/team/player');
  }

  void navigateToResults() {
    Navigator.pushNamed(context, '/team/result');
  }

  void navigateToStatistics() {
    Navigator.pushNamed(context, '/team/statistic');
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
        title: "Opções",
        onLogout: logout,
      ),
      backgroundColor: const Color(0xFFE0E0E0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomSizedBox(),
            CustomTitle(text: 'Opções'),
            CustomSizedBox(),
            Expanded(
                child: ListView(
              children: [
                OptionsCard(
                    title: "Elenco",
                    description: "Gerencie seus jogadores",
                    icon: Icon(Icons.group),
                    onTap: () {
                      navigateToPlayer();
                    }
                ),
                OptionsCard(
                    title: "Resultados",
                    description: "Veja os seus últimos resultados",
                    icon: Icon(Icons.sports_soccer),
                    onTap: () {
                      navigateToResults();
                    }
                ),
                OptionsCard(
                    title: "Estatistícas",
                    description: "Acesse as estatitíscas do seu time",
                    icon: Icon(Icons.show_chart),
                    onTap: () {
                      navigateToStatistics();
                    }
                ),
              ],
            )),
            CustomSizedBox(),

          ],
        ),
      ),
    );
  }
}
