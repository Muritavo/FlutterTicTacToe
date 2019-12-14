import 'package:flutter_tic_tac_toe/Interfaces/IPlayer.dart';

abstract class IGame {
  bool start();
  bool isRunning();
  bool addPlayer(IPlayer p);
  List<IPlayer> getPlayers();
}