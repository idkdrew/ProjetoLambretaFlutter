class Statistic {
  final int id;
  final int idResult;
  final int idPlayer;
  final int goal;
  final int assist;

  Statistic({
    required this.id,
    required this.idResult,
    required this.idPlayer,
    required this.goal,
    required this.assist
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idResult': idResult,
      'idPlayer': idPlayer,
      'goal': goal,
      'assist': assist,
    };
  }

  factory Statistic.fromMap(Map<String, dynamic> map) {
    return Statistic(
      id: map['id'],
      idResult: map['idResult'],
      idPlayer: map['idPlayer'],
      goal: map['goal'],
      assist: map['assist'],
    );
  }

}
