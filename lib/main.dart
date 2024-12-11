import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Import necessário para suporte a múltiplas localizações
import 'package:lambreta/firebase_options.dart';
import 'page/register_user_page.dart';
import 'page/team_form_page.dart';
import 'page/team_selection_page.dart';
import 'page/team_options_page.dart';
import 'page/check_user_page.dart';
import 'page/login_page.dart';
import 'page/player_page.dart';
import 'page/player_list_page.dart';
import 'page/player_form_page.dart';
import 'page/result_page.dart';
import 'page/result_list_page.dart';
import 'page/result_form_page.dart';
import 'page/statistic_list_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform

  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lambreta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Colors.blueAccent, // Para o destaque, se necessário
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', ''), // Português
      ],
      routes: {
        '/': (context) => CheckUserPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterUserPage(),
        '/team': (context) => TeamSelectionPage(),
        '/team/create': (context) => TeamFormPage(),
        '/team/options': (context) => TeamOptionsPage(),
        '/team/player': (context) => PlayerListPage(),
        '/team/player/view': (context) => PlayerPage(),
        '/team/player/create': (context) => PlayerFormPage(),
        '/team/result': (context) => ResultListPage(),
        '/team/result/view': (context) => ResultPage(),
        '/team/result/create': (context) => ResultFormPage(),
        '/team/statistic': (context) => StatisticListPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
