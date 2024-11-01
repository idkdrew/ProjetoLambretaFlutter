// main.dart
import 'package:flutter/material.dart';
import 'package:projetolambreta/view/statistics_view.dart';
import 'view/option_selection_view.dart';
import 'view/login_view.dart';
import 'view/team_selection_view.dart';
import 'view/team_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/team': (context) => TeamScreen(),
        '/career': (context) => SelectionScreen(),
        '/menu': (context) => OptionSelectionView(),
        '/statistics': (context) => StatisticsScreen(),
      },
    );
  }
}
