import '../model/player.dart';

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

}