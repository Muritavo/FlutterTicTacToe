import 'package:flutter_tic_tac_toe/Interfaces/IGame.dart';
import 'package:flutter_tic_tac_toe/Interfaces/IPlayer.dart';
import 'package:flutter_tic_tac_toe/gameTypes/Board.dart';
import 'package:flutter_tic_tac_toe/gameTypes/LocalGame.dart';
import 'package:flutter_tic_tac_toe/gameTypes/LocalPlayer.dart';
import "package:test/test.dart";

import 'enums/UseCases.dart';

void main() {
  group("Local game lifecycle", () {
    IGame gameInstance;
    setUp(() {
      gameInstance = new LocalGame();
    });
    test("A local game can be initiated", () {
      IPlayer player = new LocalPlayer();
      IPlayer player2 = new LocalPlayer();

      gameInstance.addPlayer(player);
      gameInstance.addPlayer(player2);
      gameInstance.start();

      expect(gameInstance.isRunning(), true);
    }, tags: [UseCases.UC01]);

    test("A player can join the game", () {
      IPlayer player = new LocalPlayer();
      IPlayer player2 = new LocalPlayer();

      gameInstance.addPlayer(player);
      gameInstance.addPlayer(player2);
      gameInstance.start();

      expect(gameInstance.getPlayers().length, 2);
    }, tags: [UseCases.UC06]);

    test("A player can`t join a started game", () {
      IPlayer player = new LocalPlayer();
      IPlayer player2 = new LocalPlayer();
      IPlayer intruder = new LocalPlayer();

      gameInstance.addPlayer(player);
      gameInstance.addPlayer(player2);
      gameInstance.start();

      expect(() => gameInstance.addPlayer(intruder), throwsException);
    }, tags: [UseCases.UC02]);

    test("A player can`t join a game tha he is already in", () {
      IPlayer player = new LocalPlayer();

      gameInstance.addPlayer(player);

      expect(() => gameInstance.addPlayer(player), throwsException);
    }, tags: [UseCases.UC06]);

    test("A game cannot be initiated without 1 or less players", () {
      expect(() => gameInstance.start(), throwsException);

      gameInstance.addPlayer(new LocalPlayer());
      expect(() => gameInstance.start(), throwsException);

      gameInstance.addPlayer(new LocalPlayer());
      gameInstance.start();
      expect(gameInstance.isRunning(), true);
    }, tags: [UseCases.UC01]);

    test("A 3d game is initialized by default", () {
      gameInstance.addPlayer(new LocalPlayer());
      gameInstance.addPlayer(new LocalPlayer());
      gameInstance.start();

      Board b = gameInstance.getBoard();
      expect(b.getState().length, equals(3));
    }, tags: [UseCases.UC03]);
    test("a game should have size 3 by default", () {
      gameInstance.addPlayer(new LocalPlayer());
      gameInstance.addPlayer(new LocalPlayer());
      gameInstance.start();

      Board b = gameInstance.getBoard();
      expect(b.getState().length, equals(3));
      b.getState().forEach((el) {
        expect(el.length, equals(3));
      });
    }, tags: [UseCases.UC03]);
    test("A game can be initilized with custom dimensions", () {
      gameInstance.addPlayer(new LocalPlayer());
      gameInstance.addPlayer(new LocalPlayer());
      gameInstance.setupBoard(2, 4);
      gameInstance.start();

      Board b = gameInstance.getBoard();
      expect(b.getState().length, equals(4));
      expect(b.getState()[0].length, equals(4));
      expect(b.getState()[0][0], isNull);
    }, tags: [UseCases.UC03]);
    test("A game can be initilized with custom sizes", () {
      gameInstance.addPlayer(new LocalPlayer());
      gameInstance.addPlayer(new LocalPlayer());
      gameInstance.setupBoard(3, 5);
      gameInstance.start();

      Board b = gameInstance.getBoard();
      expect(b.getState().length, equals(5));
      expect(b.getState()[0].length, equals(5));
      expect(b.getState()[0][0].length, equals(5));
      expect(b.getState()[0][0][0], isNull);
    }, tags: [UseCases.UC03]);
    test("Can check the current state of the game", () {
      IPlayer player1 = new LocalPlayer();
      IPlayer player2 = new LocalPlayer();

      gameInstance.addPlayer(player1);
      gameInstance.addPlayer(player2);

      gameInstance.start();

      var board = gameInstance.getBoard();
      expect(board, isNotNull);
    }, tags: [UseCases.UC03]);

    test("The user can place a mark", () {
      IPlayer player1 = new LocalPlayer();
      IPlayer player2 = new LocalPlayer();

      gameInstance.addPlayer(player1);
      gameInstance.addPlayer(player2);

      gameInstance.start();

      gameInstance.mark(player1, [1, 1, 1]);
      gameInstance.mark(player2, [2, 2, 2]);
      gameInstance.mark(player1, [0, 0, 0]);

      expect(gameInstance.getBoard().getState()[1][1][1], isNotNull);
      expect(gameInstance.getBoard().getState()[2][2][2], isNotNull);
      expect(gameInstance.getBoard().getState()[0][0][0], isNotNull);
      expect(gameInstance.getBoard().getState()[1][0][2], isNull);
    }, tags: [UseCases.UC07]);

    test("The player can`t place a mark where there is already one", () {
      IPlayer player1 = new LocalPlayer();
      IPlayer player2 = new LocalPlayer();

      gameInstance.addPlayer(player1);
      gameInstance.addPlayer(player2);

      gameInstance.start();

      gameInstance.mark(player1, [1, 1, 1]);
      expect(gameInstance.getBoard().getState()[1][1][1], isNotNull);
      expect(() => gameInstance.mark(player2, [1, 1, 1]), throwsException);
    }, tags: [UseCases.UC07]);

    test("The player wins when making a sequence", () {
      IPlayer player1 = new LocalPlayer();
      IPlayer player2 = new LocalPlayer();

      gameInstance.addPlayer(player1);
      gameInstance.addPlayer(player2);

      gameInstance.start();

      expect(gameInstance.mark(player1, [1, 1, 1]), false);
      expect(gameInstance.mark(player1, [2, 2, 2]), false);
      expect(gameInstance.mark(player1, [0, 0, 0]), true);
    });
  });
}
