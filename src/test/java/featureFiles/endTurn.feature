@endTurnFeature
Feature: Player ends turn scenarios

  @endTurn_1
  Scenario: Player places a tile and form a run, then ends turn
    Given New game is started
    And Player's first placement is done
    And There are 1 total turns
    And Player has "(6 red),(7 red),(8 red)" in their hand
    When Player sends a command for placing tiles of "(6 red),(7 red),(8 red)" on board
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @endTurn_2
  Scenario: Player does an invalid manipulation to the board then ends turn, player picks up 3 tiles
    Given New game is started
    When Player's first placement is done
    And There are 1 total rounds
    And Player has "(6 blue),(7 red),(8 black)" in their hand
    And There already exists tiles of "(3 red),(4 red),(5 red)" on board
    And Player sends a command for splitting row 1 at index 2
    And Player sends a command for ending current turn
    Then Player has 6 tiles
    And There are 2 total turns

  @endTurn_3
  Scenario: Player makes an invalid placement on to board, pick up 3 tiles
    Given New game is started
    And Player's first placement is done
    And There are 1 total rounds
    And Player has "(6 blue),(7 red),(8 black)" in their hand
    And Board is valid
    When Player sends a command for placing tiles of "(6 blue),(7 red),(8 black)" on board
    And Player sends a command for ending current turn
    Then Board is valid
    And Player has 6 tiles
    And There are 2 total turns

  @endTurn_4
  Scenario: Player ends turn with out making any moves, picks up 1 tile
    Given New game is started
    When Player's first placement is done
    And Player has "(6 blue),(7 red),(8 black)" in their hand
    And Player sends a command for ending current turn
    Then Player has 4 tiles
    And There are 2 total turns
