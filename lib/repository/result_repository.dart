import '../model/result.dart';
import '../controller/team_controller.dart';

class ResultRepository {
  static final List<Result> _results = [];
  static int _nextId = 1;

  static List<Result> getResults() {
    return _results.where((result) => result.idTeam == TeamController.teamSelected).toList();
  }

  static int getLastId(){
    return _nextId-1;
  }

  static Result? getResultById(int id) {
    try {
      return _results.firstWhere((result) => result.id == id);
    }catch(e){
      return null;
    }
  }

  static void createResult(bool isHome, int idTeamOpponent, int homeGoal, int awayGoal) {
    _results.add(Result(
        id: _nextId++,
        idTeam: TeamController.teamSelected,
        isHome: isHome,
        idTeamOpponent: idTeamOpponent,
        homeGoal: homeGoal,
        awayGoal: awayGoal
    ));
  }

}