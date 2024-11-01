import 'package:flutter/material.dart';
import 'package:projetolambreta/widget/custom_app_bar.dart';
import 'package:projetolambreta/widget/custom_button.dart';

class NewResultScreen extends StatefulWidget {
  const NewResultScreen({super.key});

  @override
  _NewResultScreenState createState() => _NewResultScreenState();
}

class _NewResultScreenState extends State<NewResultScreen> {
  final List<String> teams = [
    'Sport Club Corinthians Paulista',
    'Al-Hilal Saudi Football Club',
    // Adicione mais times aqui se necessário
  ];

  String? team1Name;
  String? team2Name;
  int? team1Goals;
  int? team2Goals;

  final TextEditingController team1GoalsController = TextEditingController();
  final TextEditingController team2GoalsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: CustomAppBar(title: "Novo Resultado"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            
            // Seção do Time 1
            const Text(
              'Time 1',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3366CC),
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: team1Name,
              items: teams.map((team) {
                return DropdownMenuItem(
                  value: team,
                  child: Text(team),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  team1Name = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Selecione o Time 1',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: team1GoalsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Gols do Time 1',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Seção do Time 2
            const Text(
              'Time 2',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3366CC),
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: team2Name,
              items: teams.map((team) {
                return DropdownMenuItem(
                  value: team,
                  child: Text(team),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  team2Name = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Selecione o Time 2',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: team2GoalsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Gols do Time 2',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Botão para salvar o resultado
            CustomButton(
              text: 'Salvar Resultado',
              onPressed: () {
                if (team1Name != null && team2Name != null &&
                    team1GoalsController.text.isNotEmpty &&
                    team2GoalsController.text.isNotEmpty) {
                  // Aqui você pode implementar a lógica para salvar o resultado
                  print('Time 1: $team1Name, Gols: ${team1GoalsController.text}');
                  print('Time 2: $team2Name, Gols: ${team2GoalsController.text}');
                  
                  // Limpa o formulário após o cadastro
                  setState(() {
                    team1Name = null;
                    team2Name = null;
                    team1GoalsController.clear();
                    team2GoalsController.clear();
                  });
                } else {
                  // Mostra um alerta se algum campo obrigatório estiver vazio
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Erro'),
                      content: const Text('Por favor, preencha todos os campos.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
