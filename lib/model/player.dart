class Player {
  final int id;
  final int idTeam;
  final String name;
  final String position;
  final int ovr;

  Player({
    required this.id,
    required this.idTeam,
    required this.name,
    required this.position,
    required this.ovr
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idTeam': idTeam,
      'name': name,
      'position': position,
      'ovr': ovr,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      id: map['id'],
      idTeam: map['idTeam'],
      name: map['name'],
      position: map['position'],
      ovr: map['ovr'],
    );
  }
}
