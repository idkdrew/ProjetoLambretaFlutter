import 'package:flutter/material.dart';

class CustomLoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomLoginAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(color: Color(0xFFE0E0E0))),
      backgroundColor: const Color(0xFF3366CC),
      iconTheme: const IconThemeData(color: Color(0xFFE0E0E0)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onLogout;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: Color(0xFFE0E0E0)),
      ),
      backgroundColor: const Color(0xFF3366CC),
      iconTheme: const IconThemeData(color: Color(0xFFE0E0E0)),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.exit_to_app,
            color: Color(0xFFE0E0E0),
          ),
          onPressed: onLogout,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3366CC),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  final String label;
  final bool? obscure;
  final TextInputType? keyboardType;
  final TextEditingController controller;

  const CustomInput(
      {super.key,
      required this.label,
      this.obscure,
      this.keyboardType,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: const Color(0xFF3366CC)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFF3366CC)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFF3366CC)),
        ),
      ),
    );
  }
}

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 20);
  }
}

class CustomSnackBarError {
  static void show(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(Icons.error, color: Colors.white),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 1),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class CustomSnackBarSucess {
  static void show(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(Icons.check, color: Colors.white),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 1),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class CustomTitle extends StatelessWidget {
  final String text;

  const CustomTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFF3366CC),
      ),
    );
  }
}

class OptionsCard extends StatelessWidget {
  final String title;
  final String description;
  final Icon icon;
  final VoidCallback onTap;

  const OptionsCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
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
          color: const Color(0xFFCCE5FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3366CC),
                      ),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF3366CC),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, color: Color(0xFF3366CC)),
          ],
        ),
      ),
    );
  }
}

class TeamCard extends StatelessWidget {
  final String name;
  final String date;
  final String urlImage;
  final VoidCallback onTap;

  const TeamCard({
    super.key,
    required this.name,
    required this.date,
    required this.urlImage,
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
          color: const Color(0xFFCCE5FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  urlImage,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  height: 40,
                  width: 40,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3366CC),
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF3366CC),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, color: Color(0xFF3366CC)),
          ],
        ),
      ),
    );
  }
}

class PlayerCard extends StatelessWidget {
  final String name;
  final String position;
  final int ovr;
  final VoidCallback onTap;

  const PlayerCard({
    super.key,
    required this.name,
    required this.position,
    required this.ovr,
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
          color: const Color(0xFFCCE5FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3366CC),
                  ),
                ),
                Text(
                  position,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF3366CC),
                  ),
                ),
              ],
            ),
            const Spacer(), // Este Spacer agora funciona corretamente
            Text(
              '$ovr OVR',
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3366CC),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Color(0xFF3366CC)),
          ],
        ),
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  final String homeTeamLogo;
  final String awayTeamLogo;
  final int homeTeamGoal;
  final int awayTeamGoal;
  final bool isHome;
  final VoidCallback onTap;

  const ResultCard({
    super.key,
    required this.homeTeamLogo,
    required this.awayTeamLogo,
    required this.homeTeamGoal,
    required this.awayTeamGoal,
    required this.isHome,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color containerColor;

    if ((isHome && homeTeamGoal > awayTeamGoal) ||
        (!isHome && awayTeamGoal > homeTeamGoal)) {
      containerColor = Colors.green;
    } else if ((isHome && homeTeamGoal < awayTeamGoal) ||
        (!isHome && awayTeamGoal < homeTeamGoal)) {
      containerColor = Colors.red;
    } else {
      containerColor = Colors.grey;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              isHome ? homeTeamLogo : awayTeamLogo,
              height: 40,
              width: 40,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error),
            ),
            Text(
              isHome ? '$homeTeamGoal' : '$awayTeamGoal',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Cor do texto
              ),
            ),
            const Text(
              ' x ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Cor do texto
              ),
            ),
            Text(
              isHome ? '$awayTeamGoal' : '$homeTeamGoal',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Cor do texto
              ),
            ),
            Image.network(
              isHome ? awayTeamLogo : homeTeamLogo,
              height: 40,
              width: 40,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPlayerCard extends StatefulWidget {
  final String name;
  final String position;
  final ValueChanged<int> onGoalChanged;
  final ValueChanged<int> onAssistChanged;

  const ResultPlayerCard({
    Key? key,
    required this.name,
    required this.position,
    required this.onGoalChanged,
    required this.onAssistChanged,
  }) : super(key: key);

  @override
  _ResultPlayerCardState createState() => _ResultPlayerCardState();
}

class _ResultPlayerCardState extends State<ResultPlayerCard> {
  int goal = 0;
  int assist = 0;

  void incrementGoal() {
    setState(() {
      goal++;
      widget.onGoalChanged(goal);
    });
  }

  void decrementGoal() {
    setState(() {
      if (goal > 0) goal--;
      widget.onGoalChanged(goal);
    });
  }

  void incrementAssist() {
    setState(() {
      assist++;
      widget.onAssistChanged(assist);
    });
  }

  void decrementAssist() {
    setState(() {
      if (assist > 0) assist--;
      widget.onAssistChanged(assist);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: const Color(0xFFCCE5FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3366CC),
                    ),
                  ),
                  Text(
                    widget.position,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF3366CC),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    "Gols: $goal",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF3366CC),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: decrementGoal,
                        icon: const Icon(
                          Icons.remove,
                          color: Color(0xFF3366CC),
                        ),
                      ),
                      IconButton(
                        onPressed: incrementGoal,
                        icon: const Icon(
                          Icons.add,
                          color: Color(0xFF3366CC),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    "Assistências: $assist",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF3366CC),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: decrementAssist,
                        icon: const Icon(
                          Icons.remove,
                          color: Color(0xFF3366CC),
                        ),
                      ),
                      IconButton(
                        onPressed: incrementAssist,
                        icon: const Icon(
                          Icons.add,
                          color: Color(0xFF3366CC),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticCard extends StatelessWidget {
  final String name;
  final String position;
  final int appearances;
  final int goals;
  final int assists;
  final VoidCallback onTap;

  const StatisticCard({
    super.key,
    required this.name,
    required this.position,
    required this.appearances,
    required this.goals,
    required this.assists,
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
          color: const Color(0xFFCCE5FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3366CC),
                  ),
                ),
                Text(
                  position,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF3366CC),
                  ),
                ),
              ],
            ),
            const Spacer(), // Este Spacer agora funciona corretamente
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$appearances J',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3366CC),
                  ),
                ),
                Text(
                  '$goals G',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3366CC),
                  ),
                ),
                Text(
                  '$assists A',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3366CC),
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, color: Color(0xFF3366CC)),
          ],
        ),
      ),
    );
  }
}

class ResultStatisticCard extends StatelessWidget {
  final String name;
  final String position;
  final int goals;
  final int assists;

  const ResultStatisticCard({
    super.key,
    required this.name,
    required this.position,
    required this.goals,
    required this.assists,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: const Color(0xFFCCE5FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3366CC),
                  ),
                ),
                Text(
                  position,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF3366CC),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$goals G',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3366CC),
                  ),
                ),
                Text(
                  '$assists A',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3366CC),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}