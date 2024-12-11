import '../model/player.dart';
import '../repository/player_repository.dart';

class PlayerController {
  static int playerSelected = 0;

  Future<List<Player>> fetchPlayers() async {
    try {
      return await PlayerRepository.getPlayers();
    } catch (e) {
      return [];
    }
  }

  Future<void> createPlayer(String name, String position, int ovr) async {
    try {
      await PlayerRepository.createPlayer(name, position, ovr);
    } catch (e) {

    }
  }

  Future<Player?> selectPlayerById(int id) async {
    try {
      playerSelected = id;
      return await PlayerRepository.getPlayerById(id);
    } catch (e) {
      print("Erro ao selecionar jogador: $e");
      return null;
    }
  }
}
