import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import '../model/team.dart';
import '../controller/user_controller.dart';

class TeamRepository {
  static final DatabaseReference _databaseUrl = FirebaseDatabase.instance.ref();

  static Future<List<Team>> getTeams() async {
    final snapshot = await _databaseUrl.child('teams').get();

    if (snapshot.exists && snapshot.value != null) {
      final data = snapshot.value as List<dynamic>;

      return data
          .map((teamData) => Team.fromMap(Map<String, dynamic>.from(teamData as Map)))
          .where((team) => team.login == UserController.loginLogged)
          .toList();
    }
    return [];
  }

  static Future<Team?> getTeamById(int id) async {
    final snapshot = await _databaseUrl.child('teams/$id').get();

    if (snapshot.exists && snapshot.value != null) {
      final data = snapshot.value as Map<String, dynamic>;
      return Team.fromMap(data);
    }

    return null;
  }

  static Future<void> createTeam(String name, String urlImage) async {
    final nextIdSnapshot = await _databaseUrl.child('nextIdTeam').get();
    int nextId = nextIdSnapshot.exists ? (nextIdSnapshot.value as int) : 1;

    final newTeam = Team(
      id: nextId,
      login: UserController.loginLogged,
      name: name,
      urlImage: urlImage,
      date: DateFormat('dd \'de\' MMMM \'de\' yyyy', 'pt_BR')
          .format(DateTime.now()),
    );
    await _databaseUrl.child('nextIdTeam').set(nextId + 1);
    nextId--;

    await _databaseUrl.child('teams/$nextId').set(newTeam.toMap());
  }
}
