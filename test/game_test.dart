import 'package:flutter_tic_tac_toe/Interfaces/IGame.dart';
import 'package:flutter_tic_tac_toe/Interfaces/IPlayer.dart';
import 'package:flutter_tic_tac_toe/gameTypes/LocalGame.dart';
import 'package:flutter_tic_tac_toe/gameTypes/LocalPlayer.dart';
import "package:test/test.dart";

import 'UseCases.dart';

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
  });
}