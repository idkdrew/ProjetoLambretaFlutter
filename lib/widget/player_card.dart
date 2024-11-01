import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  final String name;
  final String position;
  final int? ovr; // Parâmetro opcional
  final int? goals; // Parâmetro opcional
  final int? assists; // Parâmetro opcional

  const PlayerCard({
    super.key,
    required this.name,
    required this.position,
    this.ovr,
    this.goals,
    this.assists,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(position),
              ],
            ),
            if (ovr != null) // Exibe o OVR apenas se ele estiver disponível
              Text('$ovr OVR', style: const TextStyle(fontWeight: FontWeight.bold)),
            if (goals != null && assists != null) // Exibe gols e assistências apenas se ambos estiverem disponíveis
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('$goals G', style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('$assists A', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
