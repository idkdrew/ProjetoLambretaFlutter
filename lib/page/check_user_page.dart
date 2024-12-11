import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../controller/user_controller.dart';
import '../widget/custom_widgets.dart';

class CheckUserPage extends StatefulWidget {
  const CheckUserPage({super.key});

  @override
  State<CheckUserPage> createState() => _CheckUserPageState();
}

class _CheckUserPageState extends State<CheckUserPage> {
  StreamSubscription? streamSubscription;
  final UserController userController = UserController();

  @override
  void initState() {
    super.initState();
    streamSubscription =
      FirebaseAuth.instance
          .authStateChanges()
          .listen((User? user) {
        if (user == null) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/login',
                (Route<dynamic> route) => false,
          );
        } else {
          String email = user.email ?? '';
          if(email==''){
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/login',
                  (Route<dynamic> route) => false,
            );
          }else{
            userController.login(email);
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/team',
                  (Route<dynamic> route) => false,
            );
            CustomSnackBarSucess.show(context, "Entrando!");
          }
        }
      });
  }

  @override
  void dispose(){
    streamSubscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator(
        color: Color(0xFF3366CC),
      ),),
    );
  }
}
