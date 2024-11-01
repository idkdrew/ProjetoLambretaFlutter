import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  final String name;
  final String position;
  final int ovr;

  const PlayerCard({
    Key? key,
    required this.name,
    required this.position,
    required this.ovr,
  }) : super(key: key);

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
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(position),
              ],
            ),
            Text('$ovr OVR', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
