import '../model/result.dart';
import '../repository/result_repository.dart';

class ResultController {
  static int resultSelected = 0;

  Future<List<Result>> fetchResults() async {
    try {
      return await ResultRepository.getResults();
    } catch (e) {
      return [];
    }
  }

  Future<int> getLastId() async {
    try {
      return await ResultRepository.getLastId();
    } catch (e) {
      return 1;
    }
  }

  Future<void> createResult(bool isHome, int idTeamOpponent, int homeGoal, int awayGoal) async {
    try {
      await ResultRepository.createResult(isHome, idTeamOpponent, homeGoal, awayGoal);
    } catch (e) {

    }
  }

  Future<Result?> getResultSelected() async {
    try {
      return await ResultRepository.getResultById(resultSelected);
    } catch (e) {
      print("Erro ao selecionar resultado: $e");
      return null;
    }
  }
}
