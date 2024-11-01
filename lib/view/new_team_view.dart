import 'package:flutter/material.dart';
import 'package:projetolambreta/widget/custom_app_bar.dart';
import 'package:projetolambreta/widget/custom_button.dart';

class NewTeamScreen extends StatefulWidget {
  const NewTeamScreen({super.key});

  @override
  _NewTeamScreenState createState() => _NewTeamScreenState();
}

class _NewTeamScreenState extends State<NewTeamScreen> {
  final TextEditingController teamNameController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: CustomAppBar(title: "Cadastrar Time"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            // Campo para o nome do time
            TextFormField(
              controller: teamNameController,
              decoration: const InputDecoration(
                labelText: 'Nome do Time',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Área para mostrar a logo do time (placeholder)
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFCCE5FF),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF3366CC)),
              ),
              child: const Center(
                child: Text(
                  'Logo do Time (placeholder)',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF3366CC)),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Botão Cadastrar Time
            CustomButton(
              text: 'Cadastrar Time',
              onPressed: () {
                // Ação para salvar o time
                if (teamNameController.text.isNotEmpty) {
                  // Lógica para salvar os dados do time
                  print('Nome do Time: ${teamNameController.text}');
                  
                  // Limpa o formulário após o cadastro
                  setState(() {
                    teamNameController.clear();
                  });
                } else {
                  // Mostra um alerta se o campo obrigatório estiver vazio
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Erro'),
                      content: const Text('Por favor, preencha o nome do time.'),
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
