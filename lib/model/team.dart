class Team {
  final int id;
  final String login;
  final String name;
  final String urlImage;
  final String date;

  Team({
    required this.id,
    required this.login,
    required this.urlImage,
    required this.name,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'login': login,
      'name': name,
      'urlImage': urlImage,
      'date': date,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      id: map['id'],
      login: map['login'],
      name: map['name'],
      urlImage: map['urlImage'],
      date: map['date'],
    );
  }
}
