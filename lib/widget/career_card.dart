import 'package:flutter/material.dart';

class CareerCard extends StatelessWidget {
  final String teamName;
  final String date;
  final String? logoUrl; // Torne o logoUrl opcional
  final VoidCallback onTap;

  CareerCard({
    required this.teamName,
    required this.date,
    this.logoUrl, // Não é mais obrigatório
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
            Row(
              children: [
                // Verifique se logoUrl é nulo e mostre a imagem ou um ícone padrão
                if (logoUrl != null)
                  Image.network(
                    logoUrl!,
                    height: 40,
                    width: 40,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error),
                  )
                else
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Icon(Icons.group,
                        color: Color(0xFF3366CC)), // Ícone padrão
                  ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      teamName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3366CC),
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF3366CC),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, color: Color(0xFF3366CC)),
          ],
        ),
      ),
    );
  }
}
