class Result {
  final int id;
  final int idTeam;
  final bool isHome;
  final int idTeamOpponent;
  final int homeGoal;
  final int awayGoal;

  Result({
    required this.id,
    required this.idTeam,
    required this.isHome,
    required this.idTeamOpponent,
    required this.homeGoal,
    required this.awayGoal,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idTeam': idTeam,
      'isHome': isHome,
      'idTeamOpponent': idTeamOpponent,
      'homeGoal': homeGoal,
      'awayGoal': awayGoal,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      id: map['id'],
      idTeam: map['idTeam'],
      isHome: map['isHome'],
      idTeamOpponent: map['idTeamOpponent'],
      homeGoal: map['homeGoal'],
      awayGoal: map['awayGoal'],
    );
  }

}
