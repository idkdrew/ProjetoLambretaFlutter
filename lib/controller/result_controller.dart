import '../model/result.dart';
import '../repository/result_repository.dart';

class ResultController {
  static int resultSelected = 0;

  List<Result> fetchResults() {
    return ResultRepository.getResults();
  }

  Result? getResultSelected() {
    return ResultRepository.getResultById(resultSelected);
  }

  int getLastId(){
    return ResultRepository.getLastId();
  }

  void createResult(bool isHome, int idTeamOpponent, int homeGoal, int awayGoal) {
    ResultRepository.createResult(isHome, idTeamOpponent, homeGoal, awayGoal);
  }

}