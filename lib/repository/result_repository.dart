import 'package:firebase_database/firebase_database.dart';
import '../model/result.dart';
import '../controller/team_controller.dart';

class ResultRepository {
  static final DatabaseReference _databaseUrl = FirebaseDatabase.instance.ref();

  static Future<List<Result>> getResults() async {
    final snapshot = await _databaseUrl.child('results').get();

    if (snapshot.exists && snapshot.value != null) {
      final data = snapshot.value as List<dynamic>;

      return data
          .map((resultData) => Result.fromMap(Map<String, dynamic>.from(resultData as Map)))
          .where((result) => result.idTeam == TeamController.teamSelected)
          .toList();
    }
    return [];
  }

  static Future<int> getLastId() async {
    final nextIdSnapshot = await _databaseUrl.child('nextIdResult').get();
    int nextId = nextIdSnapshot.exists ? (nextIdSnapshot.value as int) : 1;
    return nextId-1;
  }

  static Future<Result?> getResultById(int id) async {
    id--;
    final snapshot = await _databaseUrl.child('results/$id').get();

    if (snapshot.exists && snapshot.value != null) {
      final data = Map<String, dynamic>.from(snapshot.value as Map);
      return Result.fromMap(data);
    }

    return null;
  }

  static Future<void> createResult(bool isHome, int idTeamOpponent, int homeGoal, int awayGoal) async {
    final nextIdSnapshot = await _databaseUrl.child('nextIdResult').get();
    int nextId = nextIdSnapshot.exists ? (nextIdSnapshot.value as int) : 1;

    final newResult = Result(
      id: nextId,
      idTeam: TeamController.teamSelected,
      isHome: isHome,
      idTeamOpponent: idTeamOpponent,
      homeGoal: homeGoal,
      awayGoal: awayGoal,
    );

    await _databaseUrl.child('nextIdResult').set(nextId + 1);
    nextId--;

    await _databaseUrl.child('results/$nextId').set(newResult.toMap());
  }
}
