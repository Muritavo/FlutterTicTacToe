import 'package:flutter_tic_tac_toe/Interfaces/IGame.dart';
import 'package:flutter_tic_tac_toe/Interfaces/IPlayer.dart';

import 'Board.dart';

class LocalGame implements IGame {
  bool _isRunning = false;
  List<IPlayer> players = List();
  Board _currBoard;

  @override
  bool start() {
    if (_currBoard == null) {
      this._currBoard = new Board();
    }
    if (players.length < 2) {
      throw new Exception("São necessários pelo menos 2 jogadores na partida");
    }
    _isRunning = true;
    return _isRunning;
  }

  @override
  bool isRunning() {
    return _isRunning;
  }

  @override
  bool addPlayer(IPlayer p) {
    if (players.contains(p)) {
      throw new Exception("You already are in this game");
    }
    if (isRunning()) {
      throw new Exception("The game is already running");
    }
    players.add(p);
    return true;
  }

  @override
  List<IPlayer> getPlayers() {
    return players;
  }

  @override
  Board getBoard() {
    return this._currBoard;
  }
  
  @override
  void setupBoard(dimensions, size) {
    this._currBoard = Board.fromDimensions(dimensions, size);
  }

  @override
  void mark(who, where) {
    this._currBoard.mark('0', where);
  }
}