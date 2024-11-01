import 'package:flutter/material.dart';
import 'package:projetolambreta/view/option_selection_view.dart';
import 'package:projetolambreta/view/new_team_view.dart';
import 'package:projetolambreta/widget/custom_app_bar.dart';
import '../widget/career_card.dart';
import '../widget/custom_button.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: CustomAppBar(title: "Carreiras"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Selecionar Carreira',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3366CC),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Lista de carreiras
            Expanded(
              child: ListView(
                children: [
                  CareerCard(
                    teamName: 'Sport Club Corinthians Paulista',
                    date: '30 de setembro de 2024',
                    logoUrl:
                        'https://logodetimes.com/times/corinthians/logo-corinthians-512.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OptionSelectionView()),
                      );
                    },
                  ),
                  CareerCard(
                    teamName: 'Al-Hilal Saudi Football Club',
                    date: '17 de setembro de 2024',
                    logoUrl:
                        'https://logodetimes.com/times/al-hilal/al-hilal-2023-512.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OptionSelectionView()),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Botão Nova Carreira
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: CustomButton(
                text: 'Nova Carreira',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewTeamScreen()),
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
