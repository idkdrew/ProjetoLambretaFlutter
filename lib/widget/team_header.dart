import 'package:flutter/material.dart';

class TeamHeader extends StatelessWidget {
  final String teamName;
  final String logoUrl;

  const TeamHeader({
    super.key,
    required this.teamName,
    required this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          logoUrl,
          width: 50,
          height: 50,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        ),
        const SizedBox(width: 10),
        Text(
          teamName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
