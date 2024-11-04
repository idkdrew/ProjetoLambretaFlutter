import '../model/player.dart';
import '../controller/team_controller.dart';

class PlayerRepository {
  static final List<Player> _players = [];
  static int _nextId = 1;

  static List<Player> getPlayers() {
    return _players.where((player) => player.idTeam == TeamController.teamSelected).toList();
  }

  static Player? getPlayerById(int id) {
    try {
      return _players.firstWhere((player) => player.id == id);
    }catch(e){
      return null;
    }
  }

  static void createPlayer(String name, String position, int ovr) {
    _players.add(Player(
        id: _nextId++,
        idTeam: TeamController.teamSelected,
        name: name,
        position: position,
        ovr: ovr
    ));
  }

}