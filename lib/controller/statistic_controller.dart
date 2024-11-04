import '../model/statistic.dart';
import '../repository/statistic_repository.dart';

class StatisticController {

  List<Statistic> fetchStatisticsByResults(int idResult) {
    return StatisticRepository.getStatisticsByResult(idResult);
  }

  List<Statistic> fetchStatisticsByPlayer(int idPlayer) {
    return StatisticRepository.getStatisticsByPlayer(idPlayer);
  }

  void createStatistic(int idResult, int idPlayer, int goal, int assist) {
    StatisticRepository.createStatistic(idResult, idPlayer, goal, assist);
  }

}