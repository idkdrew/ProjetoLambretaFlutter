import 'package:flutter/material.dart';
import 'package:projetolambreta/view/team_view.dart';
import 'package:projetolambreta/view/results_view.dart';
import 'package:projetolambreta/view/statistics_view.dart';
import 'package:projetolambreta/widget/custom_app_bar.dart';
import '../widget/career_card.dart';

class OptionSelectionView extends StatelessWidget {
  const OptionSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: CustomAppBar(title: "Seleção de Opções"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Selecionar Opção',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3366CC),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Lista de opções
            Expanded(
              child: ListView(
                children: [
                  CareerCard(
                    teamName: 'Time',
                    date: 'Selecione o seu time favorito',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TeamScreen()),
                      );
                    },
                  ),
                  CareerCard(
                    teamName: 'Resultados',
                    date: 'Veja os resultados mais recentes',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResultsView()),
                      );
                    },
                  ),
                  CareerCard(
                    teamName: 'Estatísticas',
                    date: 'Acesse as estatísticas do time',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StatisticsScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
