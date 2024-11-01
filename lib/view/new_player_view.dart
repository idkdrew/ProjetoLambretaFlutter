import 'package:flutter/material.dart';
import 'package:projetolambreta/widget/custom_app_bar.dart';
import 'package:projetolambreta/widget/custom_button.dart';

class NewPlayerScreen extends StatefulWidget {
  const NewPlayerScreen({super.key});

  @override
  _NewPlayerScreenState createState() => _NewPlayerScreenState();
}

class _NewPlayerScreenState extends State<NewPlayerScreen> {
  final List<String> teams = [
    'Sport Club Corinthians Paulista',
    'Al-Hilal Saudi Football Club',
    // Adicione mais times aqui se necessário
  ];

  String? selectedTeam;
  final TextEditingController playerNameController = TextEditingController();
  final TextEditingController ovrController = TextEditingController();
  final TextEditingController goalsController = TextEditingController();
  final TextEditingController assistsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: CustomAppBar(title: "Cadastrar Jogador"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            
            // Campo para selecionar o time
            DropdownButtonFormField<String>(
              value: selectedTeam,
              items: teams.map((team) {
                return DropdownMenuItem(
                  value: team,
                  child: Text(team),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedTeam = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Time',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Campo para o nome do jogador
            TextFormField(
              controller: playerNameController,
              decoration: const InputDecoration(
                labelText: 'Nome do Jogador',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Campo para OVR
            TextFormField(
              controller: ovrController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'OVR',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Campo para Goals
            TextFormField(
              controller: goalsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Goals',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Campo para Assists
            TextFormField(
              controller: assistsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Assists',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Botão Cadastrar Jogador
            CustomButton(
              text: 'Cadastrar jogador',
              onPressed: () {
                // Ação para salvar o jogador
                if (selectedTeam != null && playerNameController.text.isNotEmpty) {
                  // Lógica para salvar os dados do jogador
                  // Exemplo: print de debug
                  print('Time: $selectedTeam');
                  print('Nome: ${playerNameController.text}');
                  print('OVR: ${ovrController.text}');
                  print('Goals: ${goalsController.text}');
                  print('Assists: ${assistsController.text}');
                  
                  // Limpa o formulário após o cadastro
                  setState(() {
                    selectedTeam = null;
                    playerNameController.clear();
                    ovrController.clear();
                    goalsController.clear();
                    assistsController.clear();
                  });
                } else {
                  // Mostra um alerta se algum campo obrigatório estiver vazio
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Erro'),
                      content: const Text('Por favor, selecione um time e preencha o nome do jogador.'),
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
