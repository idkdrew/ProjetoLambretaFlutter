import 'package:firebase_database/firebase_database.dart';
import '../model/statistic.dart';
import '../controller/team_controller.dart';

class StatisticRepository {
  static final DatabaseReference _databaseUrl = FirebaseDatabase.instance.ref();

  static Future<List<Statistic>> getStatisticsByResult(int idResult) async {
    final snapshot = await _databaseUrl.child('statistics').get();

    if (snapshot.exists && snapshot.value != null) {
      final data = snapshot.value as List<dynamic>;

      return data
          .map((statisticData) => Statistic.fromMap(Map<String, dynamic>.from(statisticData as Map)))
          .where((statistic) => statistic.idResult == idResult)
          .toList();
    }
    return [];
  }

  static Future<List<Statistic>> getStatisticsByPlayer(int idPlayer) async {
    final snapshot = await _databaseUrl.child('statistics').get();

    if (snapshot.exists && snapshot.value != null) {
      final data = snapshot.value as List<dynamic>;

      return data
          .map((statisticData) => Statistic.fromMap(Map<String, dynamic>.from(statisticData as Map)))
          .where((statistic) => statistic.idPlayer == idPlayer)
          .toList();
    }
    return [];
  }

  static Future<void> createStatistic(int idResult, int idPlayer, int goal, int assist) async {
    final nextIdSnapshot = await _databaseUrl.child('nextIdStatistic').get();
    int nextId = nextIdSnapshot.exists ? (nextIdSnapshot.value as int) : 1;

    final newStatistic = Statistic(
      id: nextId,
      idResult: idResult,
      idPlayer: idPlayer,
      goal: goal,
      assist: assist,
    );
    await _databaseUrl.child('nextIdStatistic').set(nextId + 1);
    nextId--;

    await _databaseUrl.child('statistics/$nextId').set(newStatistic.toMap());
  }
}
