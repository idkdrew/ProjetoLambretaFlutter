import 'package:flutter/material.dart';

class TeamHeader extends StatelessWidget {
  final String teamName;
  final String logoUrl;

  const TeamHeader({
    Key? key,
    required this.teamName,
    required this.logoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          logoUrl,
          width: 50,
          height: 50,
          errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
        ),
        SizedBox(width: 10),
        Text(
          teamName,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
