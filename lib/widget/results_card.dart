import 'package:flutter/material.dart';

class ResultsCard extends StatelessWidget {
  final String homeTeamLogo; // URL ou caminho da imagem do time da casa
  final String awayTeamLogo; // URL ou caminho da imagem do time visitante
  final int homeTeamGoals; // Número de gols do time da casa
  final int awayTeamGoals; // Número de gols do time visitante
  final VoidCallback onTap; // Ação a ser realizada ao clicar no card

  ResultsCard({
    required this.homeTeamLogo,
    required this.awayTeamLogo,
    required this.homeTeamGoals,
    required this.awayTeamGoals,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Color(0xFFCCE5FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Imagem do time da casa
            Image.network(
              homeTeamLogo,
              height: 40,
              width: 40,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
            // Resultado no centro
            Text(
              '$homeTeamGoals x $awayTeamGoals', // Mostra os gols no formato "3 x 0"
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3366CC),
              ),
            ),
            // Imagem do time visitante
            Image.network(
              awayTeamLogo,
              height: 40,
              width: 40,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}
