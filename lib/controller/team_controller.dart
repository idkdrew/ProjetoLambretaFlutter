import '../model/team.dart';
import '../repository/team_repository.dart';

class TeamController {
  static int teamSelected = 0;

  List<Team> fetchTeams() {
    return TeamRepository.getTeams();
  }

  void createTeam(String name, String urlImage) {
      TeamRepository.createTeam(name, urlImage);
  }

}