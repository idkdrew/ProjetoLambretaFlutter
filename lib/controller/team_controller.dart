// controllers/team_controller.dart
import '../model/player_model.dart';

class TeamController {
  List<Player> players = [
    Player(name: 'Hugo Souza', position: 'GOL', ovr: 75),
    Player(name: 'André Ramalho', position: 'ZAG', ovr: 79),
    Player(name: 'Rodrigo Garro', position: 'MEI', ovr: 80),
    Player(name: 'Memphis Depay', position: 'ATA', ovr: 82),
  ];

  void addPlayer(Player player) {
    players.add(player);
  }
}
