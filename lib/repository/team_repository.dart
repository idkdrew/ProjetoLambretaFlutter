import '../model/team.dart';
import '../controller/user_controller.dart';
import 'package:intl/intl.dart';

class TeamRepository {
  static final List<Team> _teams = [];
  static int _nextId = 1;

  static List<Team> getTeams() {
    return _teams
        .where((team) => team.login == UserController.loginLogged)
        .toList();
  }

  static Team? getTeamById(int id) {
    try {
      return _teams.firstWhere((team) => team.id == id);
    } catch (e) {
      return null;
    }
  }

  static void createTeam(String name, String urlImage) {
    _teams.add(Team(
        id: _nextId++,
        login: UserController.loginLogged,
        name: name,
        urlImage: urlImage,
        date: DateFormat('dd \'de\' MMMM \'de\' yyyy', 'pt_BR')
            .format(DateTime.now())));
  }
}
