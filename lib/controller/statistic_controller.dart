import '../model/statistic.dart';
import '../repository/statistic_repository.dart';

class StatisticController {

  Future<List<Statistic>> fetchStatisticsByResults(int idResult) async {
    try {
      return await StatisticRepository.getStatisticsByResult(idResult);
    } catch (e) {
      return [];
    }
  }

  Future<List<Statistic>> fetchStatisticsByPlayer(int idPlayer) async {
    try {
      return await StatisticRepository.getStatisticsByPlayer(idPlayer);
    } catch (e) {
      return [];
    }
  }

  Future<void> createStatistic(int idResult, int idPlayer, int goal, int assist) async {
    try {
      await StatisticRepository.createStatistic(idResult, idPlayer, goal, assist);
    } catch (e) {

    }
  }

}
