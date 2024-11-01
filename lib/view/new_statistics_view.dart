import 'package:flutter/material.dart';
import 'package:projetolambreta/widget/custom_app_bar.dart';
import 'package:projetolambreta/widget/custom_button.dart';

class NewStatisticsScreen extends StatefulWidget {
  const NewStatisticsScreen({super.key});

  @override
  _NewStatisticsScreenState createState() => _NewStatisticsScreenState();
}

class _NewStatisticsScreenState extends State<NewStatisticsScreen> {
  final List<String> players = [
    'Hugo Souza',
    'André Ramalho',
    'Rodrigo Garro',
    'Memphis Depay',
    // Adicione mais jogadores aqui se necessário
  ];

  String? selectedPlayer;
  final TextEditingController assistsController = TextEditingController();
  final TextEditingController goalsController = TextEditingController();
  final TextEditingController positionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: CustomAppBar(title: "Nova estatística"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            // Seção para selecionar o jogador
            DropdownButtonFormField<String>(
              value: selectedPlayer,
              items: players.map((player) {
                return DropdownMenuItem(
                  value: player,
                  child: Text(player),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPlayer = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Selecione o Jogador',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Campo para Posição
            TextFormField(
              controller: positionController,
              decoration: const InputDecoration(
                labelText: 'Posição',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Campo para Gols
            TextFormField(
              controller: goalsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Gols',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Campo para Assistências
            TextFormField(
              controller: assistsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Assistências',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Botão para salvar estatísticas
            CustomButton(
              text: 'Salvar Estatísticas',
              onPressed: () {
                if (selectedPlayer != null && goalsController.text.isNotEmpty &&
                    assistsController.text.isNotEmpty && positionController.text.isNotEmpty) {
                  // Aqui você pode implementar a lógica para salvar as estatísticas
                  print('Jogador: $selectedPlayer');
                  print('Gols: ${goalsController.text}');
                  print('Assistências: ${assistsController.text}');
                  print('Posição: ${positionController.text}');
                  
                  // Limpa o formulário após o cadastro
                  setState(() {
                    selectedPlayer = null;
                    goalsController.clear();
                    assistsController.clear();
                    positionController.clear();
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
