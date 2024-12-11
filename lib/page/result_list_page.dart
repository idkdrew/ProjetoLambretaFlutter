import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/custom_widgets.dart';

import '../controller/result_controller.dart';
import '../model/result.dart';

class ResultListPage extends StatefulWidget {
  @override
  _ResultListPage createState() => _ResultListPage();
}

class _ResultListPage extends State<ResultListPage> {
  final ResultController resultController = ResultController();
  List<Result> results = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchResults();
  }

  Future<void> fetchResults() async {
    if (!mounted) return;
    setState(() {
      isLoading = true;
    });
    try {
      final fetchResults = await resultController.fetchResults();
      if (mounted) {
        setState(() {
          results = fetchResults;
        });
      }
    } catch (e) {
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void navigateToCreateResult() async {
    final result = await Navigator.pushNamed(context, '/team/result/create');
    if (result == true) {
      fetchResults();
    }
  }

  void navigateToResult(int id) {
    ResultController.resultSelected = id;
    Navigator.pushNamed(context, '/team/result/view');
  }

  void logout() async {
    await FirebaseAuth.instance.signOut().then((user) => {
      CustomSnackBarError.show(context, "Saindo!"),
      Navigator.pushReplacementNamed(context, '/'),

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Resultados",
        onLogout: logout,
      ),
      backgroundColor: const Color(0xFFE0E0E0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomSizedBox(),
            CustomTitle(text: 'Resultados'),
            CustomSizedBox(),
            isLoading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : results.isEmpty
                ? const Center(
              child: Text(
                "Nenhum resultado encontrado.",
                style: TextStyle(fontSize: 16),
              ),
            )
                :
            Expanded(
              child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final result = results[index];
                    return ResultCard(
                        homeTeamLogo: "a ",
                        awayTeamLogo: "a",
                        homeTeamGoal: result.homeGoal,
                        awayTeamGoal: result.awayGoal,
                        isHome: result.isHome,
                        onTap: (){
                          navigateToResult(result.id);
                        });
                  }),
            ),
            CustomSizedBox(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: CustomButton(
                text: 'Novo Resultado',
                onPressed: navigateToCreateResult,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
