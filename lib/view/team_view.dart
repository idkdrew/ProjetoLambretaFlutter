import 'package:flutter/material.dart';
import 'package:projetolambreta/widget/custom_app_bar.dart';
import '../widget/player_card.dart';
import '../widget/custom_button.dart';

class TeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E0E0),
      appBar: CustomAppBar(title: "Time"),
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
                SizedBox(width: 8),
                Text(
                  'SC Corinthians Paulista',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3366CC),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Lista de jogadores
            Expanded(
              child: ListView(
                children: [
                  PlayerCard(name: 'Hugo Souza', position: 'GOL', ovr: 75),
                  PlayerCard(name: 'André Ramalho', position: 'ZAG', ovr: 79),
                  PlayerCard(name: 'Rodrigo Garro', position: 'MEI', ovr: 80),
                  PlayerCard(name: 'Memphis Depay', position: 'ATA', ovr: 82),
                ],
              ),
            ),

            // Botão Novo Jogador
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: CustomButton(
                text: 'Novo Jogador',
                onPressed: () {
                  // Ação para adicionar um novo jogador
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}