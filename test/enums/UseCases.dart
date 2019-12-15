class UseCase {
  final String code;
  final String description;

  const UseCase(this.code, this.description);
}

class UseCases {
  static dynamic UC01 = const UseCase("UC01", "As a user I want to be able to choose when start the game, so i can wait for people to join my game").code;
  static dynamic UC02 = const UseCase("UC02", "As a user I want to prevent other players from joining the game when it`s started so the game is not interrupted").code;
  static dynamic UC03 = const UseCase("UC03", "As a player I want to be able to see the other players moves so I can plan my next moves").code;
  static dynamic UC04 = const UseCase("UC04", "As a player I want to know when I won the game so I can stop playing").code;
  static dynamic UC05 = const UseCase("UC05", "As a user I want to be able to choose to let the game to continue or not after someone wins the game").code;
  static dynamic UC06 = const UseCase("UC06", "As a player I want to be able to join a game so I can play a game that I am trying to join").code;
  static dynamic UC07 = const UseCase("UC07", "As a player I want to be able to place a mark on the game so I can play the game").code;
}