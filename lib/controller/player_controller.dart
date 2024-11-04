import '../model/player.dart';
import '../repository/player_repository.dart';

class PlayerController {
  static int playerSelected = 0;

  List<Player> fetchPlayers() {
    return PlayerRepository.getPlayers();
  }

  Player? getPlayerSelected() {
    return PlayerRepository.getPlayerById(playerSelected);
  }

  void createPlayer(String name, String position, int ovr) {
    PlayerRepository.createPlayer(name, position, ovr);
  }

}