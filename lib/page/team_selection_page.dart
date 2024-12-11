import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/custom_widgets.dart';
import '../controller/team_controller.dart';
import '../model/team.dart';

class TeamSelectionPage extends StatefulWidget {
  @override
  _TeamSelectionPage createState() => _TeamSelectionPage();
}

class _TeamSelectionPage extends State<TeamSelectionPage> {
  final TeamController teamController = TeamController();
  List<Team> teams = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTeams();
  }

  Future<void> fetchTeams() async {
    if (!mounted) return;
    setState(() {
      isLoading = true;
    });
    try {
      final fetchedTeams = await teamController.fetchTeams();
      if (mounted) {
        setState(() {
          teams = fetchedTeams;
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

  void navigateToCreateTeam() async {
    final result = await Navigator.pushNamed(context, '/team/create');
    if (result == true) {
      fetchTeams();
    }
  }

  void navigateToOptionsTeam(int id) {
    TeamController.teamSelected = id;
    Navigator.pushNamed(context, '/team/options');
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut().then((_) {
      CustomSnackBarError.show(context, "Saindo!");
      Navigator.pushReplacementNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Carreiras",
        onLogout: logout,
      ),
      backgroundColor: const Color(0xFFE0E0E0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomSizedBox(),
            CustomTitle(text: 'Carreiras'),
            CustomSizedBox(),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : teams.isEmpty
                    ? const Center(
                        child: Text(
                          "Nenhuma carreira encontrada.",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: teams.length,
                          itemBuilder: (context, index) {
                            final team = teams[index];
                            return TeamCard(
                              name: team.name,
                              date: team.date,
                              urlImage: team.urlImage,
                              onTap: () {
                                navigateToOptionsTeam(team.id);
                              },
                            );
                          },
                        ),
                      ),
            CustomSizedBox(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: CustomButton(
                text: 'Nova Carreira',
                onPressed: navigateToCreateTeam,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
