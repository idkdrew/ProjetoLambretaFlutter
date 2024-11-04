import '../model/statistic.dart';
import '../controller/team_controller.dart';

class StatisticRepository {
  static final List<Statistic> _statistic = [];
  static int _nextId = 1;

  static List<Statistic> getStatisticsByResult(int idResult) {
    return _statistic.where((statistic) => statistic.idResult == idResult).toList();
  }

  static List<Statistic> getStatisticsByPlayer(int idPlayer) {
    return _statistic.where((statistic) => statistic.idPlayer == idPlayer).toList();
  }

  static Statistic? getResultById(int id) {
    try {
      return _statistic.firstWhere((statistic) => statistic.id == id);
    }catch(e){
      return null;
    }
  }

  static void createStatistic(int idResult, int idPlayer, int goal, int assist) {
    _statistic.add(Statistic(
        id: _nextId++,
        idResult: idResult,
        idPlayer: idPlayer,
        goal: goal,
        assist: assist
    ));
  }

}