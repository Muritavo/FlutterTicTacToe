import 'package:flutter_tic_tac_toe/Interfaces/IPlayer.dart';
import 'package:flutter_tic_tac_toe/gameTypes/Board.dart';

abstract class IGame {
  bool start();
  bool isRunning();
  bool addPlayer(IPlayer p);
  List<IPlayer> getPlayers();
  Board getBoard();
  void setupBoard(dimensions, size);
  bool mark(who, where);
}