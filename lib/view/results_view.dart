import 'package:flutter/material.dart';
import 'package:projetolambreta/view/team_view.dart';
// import 'package:projetolambreta/view/results_view.dart';
// import 'package:projetolambreta/view/statistics_view.dart';
import 'package:projetolambreta/widget/custom_app_bar.dart';
import '../widget/results_card.dart';
import '../widget/custom_button.dart';

class ResultsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E0E0),
      appBar: CustomAppBar(title: "Resultados"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Selecionar Opção',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3366CC),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Lista de opções
            Expanded(
              child: ListView(
                children: [
                  ResultsCard(
                    homeTeamLogo:
                        'https://logodetimes.com/times/corinthians/logo-corinthians-512.png',
                    awayTeamLogo:
                        'https://logodetimes.com/times/al-hilal/al-hilal-2023-512.png',
                    homeTeamGoals: 3,
                    awayTeamGoals: 0,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TeamScreen()),
                      );
                    },
                  ),
                  ResultsCard(
                    homeTeamLogo:
                        'https://logodetimes.com/times/corinthians/logo-corinthians-512.png',
                    awayTeamLogo:
                        'https://logodetimes.com/times/al-hilal/al-hilal-2023-512.png',
                    homeTeamGoals: 3,
                    awayTeamGoals: 0,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TeamScreen()),
                      );
                    },
                  ),
                  ResultsCard(
                    homeTeamLogo:
                        'https://logodetimes.com/times/corinthians/logo-corinthians-512.png',
                    awayTeamLogo:
                        'https://logodetimes.com/times/al-hilal/al-hilal-2023-512.png',
                    homeTeamGoals: 1,
                    awayTeamGoals: 0,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TeamScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: CustomButton(
                text: 'Novo resultado',
                onPressed: () {
                  // Ação para iniciar uma nova carreira
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
