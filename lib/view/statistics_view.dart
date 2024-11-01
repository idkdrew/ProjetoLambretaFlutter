import 'package:flutter/material.dart';
import 'package:projetolambreta/widget/custom_app_bar.dart';
import 'package:projetolambreta/view/new_statistics_view.dart';
import '../widget/player_card.dart';
import '../widget/custom_button.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: CustomAppBar(title: "Estatísticas"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Título e logo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://logodetimes.com/times/corinthians/logo-corinthians-512.png',
                  height: 50,
                ),
                const SizedBox(width: 8),
                const Text(
                  'SC Corinthians Paulista',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3366CC),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Lista de jogadores com estatísticas de gols e assistências
            Expanded(
              child: ListView(
                children: const [
                  PlayerCard(name: 'Hugo Souza', position: 'GOL', goals: 0, assists: 0),
                  PlayerCard(name: 'André Ramalho', position: 'ZAG', goals: 2, assists: 1),
                  PlayerCard(name: 'Rodrigo Garro', position: 'MEI', goals: 8, assists: 7),
                  PlayerCard(name: 'Memphis Depay', position: 'ATA', goals: 2, assists: 2),
                ],
              ),
            ),

            // Botão para nova estatística
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: CustomButton(
                text: 'Nova Estatística',
                onPressed: () {
                  // Navegar para a tela de cadastro de nova estatística
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewStatisticsScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
