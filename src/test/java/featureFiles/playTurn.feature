@playTurnFeature
Feature: playTurnFeature, playTurn use case test scenarios

  @playTurn_1
  Scenario: Play Turn - places a tile and form a run, then finishes turn
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(3 red),(4 red),(5 red)" on board
    And Player has "(6 red)" in their hand
    When Player sends a command for giving tiles of "(6 red)" to row 1
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_2
  Scenario: Play Turn - places a tile and form a group, then finishes turn
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(3 red),(3 blue),(3 black)" on board
    And Player has "(3 yellow)" in their hand
    When Player sends a command for giving tiles of "(3 yellow)" to row 1
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_3
  Scenario: Play Turn - places multiple tiles and form a run together with existing tiles on board, then finishes turn
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(3 red),(4 red),(5 red)" on board
    And Player has "(6 red),(7 red)" in their hand
    When Player sends a command for giving tiles of "(6 red),(7 red)" to row 1
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_4
  Scenario: Play Turn - places multiple tiles that form a run, then finishes turn
    Given New game is started
    And Player's first placement is done
    And Player has "(3 red),(4 red),(5 red),(6 red)" in their hand
    When Player sends a command for placing tiles of "(3 red),(4 red),(5 red),(6 red)" on board
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_5
  Scenario: Play Turn - places multiple tiles that form a group, then finishes turn
    Given New game is started
    And Player's first placement is done
    And Player has "(3 red),(3 blue),(3 black),(3 yellow)" in their hand
    When Player sends a command for placing tiles of "(3 red),(3 blue),(3 black),(3 yellow)" on board
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_6
  Scenario: Play Turn - places multiple tiles that form a run, and places multiple tiles that form another run, then finishes turn
    Given New game is started
    And Player's first placement is done
    And Player has "(3 red),(4 red),(5 red),(8 blue),(9 blue),(10 blue)" in their hand
    When Player sends a command for placing tiles of "(3 red),(4 red),(5 red)" on board
    And Player sends a command for placing tiles of "(8 blue),(9 blue),(10 blue)" on board
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_7
  Scenario: Play Turn - places multiple tiles that form a group, and places multiple tiles that form another group, then finishes turn
    Given New game is started
    And Player's first placement is done
    And Player has "(3 red),(3 blue),(3 black),(8 blue),(8 black),(8 yellow)" in their hand
    When Player sends a command for placing tiles of "(3 red),(3 blue),(3 black)" on board
    And Player sends a command for placing tiles of "(8 blue),(8 black),(8 yellow)" on board
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_8
  Scenario: Play Turn - places multiple tiles that form a group, and places multiple tiles that form a run, then finishes turn
    Given New game is started
    And Player's first placement is done
    And Player has "(3 red),(3 blue),(3 black),(8 blue),(9 blue),(10 blue)" in their hand
    When Player sends a command for placing tiles of "(3 red),(3 blue),(3 black)" on board
    And Player sends a command for placing tiles of "(8 blue),(9 blue),(10 blue)" on board
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_9
  Scenario: Play Turn - places multiple tiles but it is an invalid placement, undo and places other tiles that form a run, then finishes turn
    Given New game is started
    And Player's first placement is done
    And Player has "(3 red),(5 blue),(7 black),(8 blue),(9 blue),(10 blue)" in their hand
    When Player sends a command for placing tiles of "(3 red),(5 blue),(7 black)" on board
    And Player sends a command for undoing the previous action
    And Player sends a command for placing tiles of "(8 blue),(9 blue),(10 blue)" on board
    And Board is valid
    And Player sends a command for ending current turn
    Then Player has 3 tiles
    And There are 2 total turns

  @playTurn_10
  Scenario: Play Turn - places multiple tiles but it is an invalid placement, undo and places other tiles that form a group, then finishes turn
    Given New game is started
    And Player's first placement is done
    And Player has "(3 red),(5 blue),(7 black),(8 blue),(8 red),(8 yellow)" in their hand
    When Player sends a command for placing tiles of "(3 red),(5 blue),(7 black)" on board
    And Player sends a command for undoing the previous action
    And Player sends a command for placing tiles of "(8 blue),(8 red),(8 yellow)" on board
    And Board is valid
    And Player sends a command for ending current turn
    Then Player has 3 tiles
    And There are 2 total turns

  @playTurn_11
  Scenario: Play Turn - places a tile but it is an invalid placement, undo and places another tile that form a run, then finishes turn
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(3 red),(4 red),(5 red)" on board
    And Player has "(1 black),(6 red)" in their hand
    When Player sends a command for giving tiles of "(1 black)" to row 1
    And Player sends a command for undoing the previous action
    And Player sends a command for giving tiles of "(6 red)" to row 1
    And Board is valid
    And Player sends a command for ending current turn
    Then Player has 1 tiles
    And There are 2 total turns

  @playTurn_12
  Scenario: Play Turn - places a tile but it is an invalid placement, undo and places another tile that form a group, then finishes turn
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(8 blue),(8 red),(8 yellow)" on board
    And Player has "(1 black),(8 black)" in their hand
    When Player sends a command for giving tiles of "(1 black)" to row 1
    And Player sends a command for undoing the previous action
    And Player sends a command for giving tiles of "(8 black)" to row 1
    And Board is valid
    And Player sends a command for ending current turn
    Then Player has 1 tiles
    And There are 2 total turns

  @playTurn_13
  Scenario: Play Turn - splits tiles and places a tile to form a run
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(3 red),(4 red),(5 red),(6 red),(7 red)" on board
    And Player has "(8 red)" in their hand
    When Player sends a command for splitting row 1 at index 3
    And Player sends a command for giving tiles of "(8 red)" to row 2
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_14
  Scenario: Play Turn - splits tiles and places multiple tiles to form a run
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(3 red),(4 red),(5 red),(6 red)" on board
    And Player has "(7 red),(8 red)" in their hand
    When Player sends a command for splitting row 1 at index 3
    And Player sends a command for giving tiles of "(7 red),(8 red)" to row 2
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_15
  Scenario: Play Turn - splits tiles and places tiles with them to form a group
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(3 red),(4 red),(5 red),(6 red)" on board
    And Player has "(6 yellow),(6 blue)" in their hand
    When Player sends a command for splitting row 1 at index 3
    And Player sends a command for giving tiles of "(6 yellow),(6 blue)" to row 2
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_16
  Scenario: Play Turn - splits tiles from two rows, combine splitted tiles and places a tile with them to form a group
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(3 red),(4 red),(5 red),(6 red)" on board
    And There already exists tiles of "(3 blue),(4 blue),(5 blue),(6 blue)" on board
    And Player has "(6 black)" in their hand
    When Player sends a command for splitting row 1 at index 3
    And Player sends a command for splitting row 2 at index 3
    And Player sends a command for moving row 4 indices "1" to row 3
    And Player sends a command for giving tiles of "(6 black)" to row 3
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_17
  Scenario: Play Turn - move a run of tiles into another run to combine
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(3 red),(4 red),(5 red)" on board
    And There already exists tiles of "(6 red),(7 red),(8 red)" on board
    When Player sends a command for moving row 2 indices "1 2 3" to row 1
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid

  @playTurn_18
  Scenario: Play Turn - move a run of tiles into another run, undo and place a tile to form a run
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(3 red),(4 red),(5 red)" on board
    And There already exists tiles of "(9 red),(10 red),(11 red)" on board
    And Player has "(6 red)" in their hand
    When Player sends a command for moving row 2 indices "1 2 3" to row 1
    And Player sends a command for undoing the previous action
    And Player sends a command for giving tiles of "(6 red)" to row 1
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_19
  Scenario: Play Turn - split a group of tiles into two rows, undo and place a tile to form a group
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(3 red),(3 blue),(3 yellow)" on board
    And Player has "(3 black)" in their hand
    When Player sends a command for splitting row 1 at index 2
    And Player sends a command for undoing the previous action
    And Player sends a command for giving tiles of "(3 black)" to row 1
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_20
  Scenario: Play Turn - places a tile that does not exist, places an existing tile and form a run, then finishes turn
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(3 red),(4 red),(5 red)" on board
    And Player has "(6 red)" in their hand
    When Player sends a command for giving tiles of index 4 to row 1 which doesn't exist
    And Player sends a command for giving tiles of "(6 red)" to row 1
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_21
  Scenario: Play Turn - places a tile that does not exist, places an existing tile and form a group, then finishes turn
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(3 red),(3 blue),(3 black)" on board
    And Player has "(3 yellow)" in their hand
    When Player sends a command for giving tiles of index 2 to row 1 which doesn't exist
    And Player sends a command for giving tiles of "(3 yellow)" to row 1
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurnNonRecursive-1
  Scenario: Play Turn - It is player's turn, the player chooses to end their turn
    Given New game is started
    When It is player's turn
    And Board is valid
    And There are 1 total turns
    And Player sends a command for ending current turn
    Then There are 2 total turns

  @playTurn_22
  Scenario: PlayTurn - places a tile that does not exist, manipulates board, places an existing tile and form a group, then finishes turn
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(3 red),(3 blue),(3 black),(3 yellow)" on board
    And Player has "(4 yellow),(5 yellow)" in their hand
    When Player sends a command for giving tiles of index 5 to row 1 which doesn't exist
    And Player sends a command for splitting row 1 at index 3
    And Player sends a command for giving tiles of "(4 yellow),(5 yellow)" to row 2
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_23
  Scenario: PlayTurn - player manipulates board, places a tile that doesn't exist, player then ends turn
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(3 red),(3 blue),(3 black),(3 yellow)" on board
    And Player has "(4 yellow),(5 yellow)" in their hand
    When Player sends a command for splitting row 1 at index 3
    And Player sends a command for giving tiles of index 5 to row 2 which doesn't exist
    And Player sends a command for ending current turn
    And There are 2 total turns

  @playTurn24
  Scenario: PlayTurn - player manipulates board, places a tile that doesn't exist, places an existing tile and form a group or run, then finishes turn
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(3 red),(3 blue),(3 black),(3 yellow)" on board
    And Player has "(4 yellow),(5 yellow)" in their hand
    When Player sends a command for splitting row 1 at index 3
    And Player sends a command for giving tiles of index 5 to row 1 which doesn't exist
    And Player sends a command for giving tiles of "(4 yellow),(5 yellow)" to row 2
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn25
  Scenario: PlayTurn - player manipulates board, places a tile that doesn't exist, player manipulates board again, places existing tiles and form a group or run,
            then finished turn
    Given New game is started
    And Player's first placement is done
    And There already exists tiles of "(3 red),(4 red),(5 red),(6 red),(7 red),(8 red)" on board
    And Player has "(5 red),(7 red),(9 red)" in their hand
    When Player sends a command for splitting row 1 at index 2
    And Player sends a command for giving tiles of index 5 to row 0 which doesn't exist
    And Player sends a command for splitting row 2 at index 2
    And Player sends a command for giving tiles of "(5 red)" to row 1
    And Player sends a command for giving tiles of "(7 red)" to row 2
    And Player sends a command for giving tiles of "(9 red)" to row 3
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_26
  Scenario: PlayTurn - places a tile that doesn't exist, then finishes turn
    Given New game is started
    When It is player's turn
    And Player's first placement is done
    And There already exists tiles of "(3 red),(4 red),(5 red)" on board
    And Player has "(5 red),(6 red),(9 red)" in their hand
    And Board is valid
    Then Player sends a command for giving tiles of index 4 to row 1 which doesn't exist
    And There are 1 total turns
    And Player sends a command for ending current turn
    And There are 2 total turns
    And Board is valid

  @playTurn_27
  Scenario: PlayTurn - player places, places an existing tile and form a group or run, player ends turn
    Given New game is started
    When It is player's turn
    And Player's first placement is done
    And Player has "(6 red),(7 red),(8 red)" in their hand
    And Player sends a command for placing tiles of "(6 red),(7 red),(8 red)" on board
    And Board is valid
    Then It is player's turn
    And Player sends a command for ending current turn
    And There are 2 total turns

  @playTurn_28
  Scenario: PlayTurn - places multiple tiles that form a run, manipulates board, and places multiple tiles that form another run, then finishes turn
    Given New game is started
    When It is player's turn
    And Player's first placement is done
    And There already exists tiles of "(7 blue),(8 blue),(9 blue),(10 blue)" on board
    And Player has "(3 red),(4 red),(5 red),(11 blue),(12 blue)" in their hand
    And Player sends a command for placing tiles of "(3 red),(4 red),(5 red)" on board
    And Player sends a command for splitting row 1 at index 3
    And Player sends a command for giving tiles of "(11 blue),(12 blue)" to row 3
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @playTurn_29
  Scenario: PlayTurn - player manipulates board, places tiles, undoes previous action, place tiles that form a group or run, ends turn
    Given New game is started
    When It is player's turn
    And Player's first placement is done
    And There already exists tiles of "(7 blue),(8 blue),(9 blue),(10 blue)" on board
    And Player has "(3 red),(4 red),(5 red)" in their hand
    And Player sends a command for splitting row 1 at index 3
    And Player sends a command for placing tiles of "(3 red),(4 red),(5 red)" on board
    And Player sends a command for undoing the previous action
    And Player sends a command for placing tiles of "(3 red),(4 red),(5 red)" on board
    Then Board is valid
    And Player sends a command for ending current turn
    And Board is valid
    And There are 2 total turns

  @playTurn_30
  Scenario: PlayTurn - player manipulates board, places tiles, undoes previous action, manipulates the board, place tiles that form a group or run, ends turn
    Given New game is started
    When It is player's turn
    And Player's first placement is done
    And There already exists tiles of "(7 blue),(8 blue),(9 blue),(10 blue)" on board
    And Player has "(10 red),(10 yellow)" in their hand
    And Player sends a command for splitting row 1 at index 3
    And Player sends a command for giving tiles of "(10 red),(10 yellow)" to row 2
    And Player sends a command for undoing the previous action
    And Player sends a command for splitting row 1 at index 3
    And Player sends a command for giving tiles of "(10 red),(10 yellow)" to row 2
    Then Board is valid
    And Player sends a command for ending current turn
    And Board is valid
    And There are 2 total turns


  @playTurnRecursiveCategory2-4
  Scenario: Play Turn - It is the player's turn, player splits a row, gives tiles to newly created row, then ends their turn
    Given New game is started
    When It is player's turn
    And Player's first placement is done
    And There are 1 total turns
    And There already exists tiles of "(3 red),(4 red),(5 red),(6 red),(7 red),(8 red)" on board
    And Player has "(5 red),(7 red),(9 red)" in their hand
    And Board is valid
    And Player sends a command for splitting row 1 at index 2
    And Player sends a command for giving tiles of "(5 red)" to row 1
    And Board is valid
    And There are 1 total turns
    And Player sends a command for ending current turn
    Then There are 2 total turns
    And Board is valid

  @playTurnRecursiveCategory2-5
  Scenario: Play Turn - It is the player's turn, player splits a row, gives tiles to newly created row, places tiles, then ends their turn
    Given New game is started
    When It is player's turn
    And Player's first placement is done
    And There are 1 total turns
    And There already exists tiles of "(3 red),(4 red),(5 red),(6 red),(7 red),(8 red)" on board
    And Player has "(5 red),(7 red),(8 red),(9 red)" in their hand
    And Board is valid
    And Player sends a command for splitting row 1 at index 2
    And Player sends a command for giving tiles of "(5 red)" to row 1
    And Player sends a command for placing tiles of "(7 red),(8 red),(9 red)" on board
    And Board is valid
    And There are 1 total turns
    And Player sends a command for ending current turn
    Then There are 2 total turns
    And Board is valid

  @playTurnRecursiveCategory2-6
  Scenario: Play Turn - It is the player's turn, player splits a row, gives tiles to newly created row, splits another row, places tiles on board, then ends their turn
    Given New game is started
    When It is player's turn
    And Player's first placement is done
    And There are 1 total turns
    And There already exists tiles of "(3 red),(4 red),(5 red),(6 red),(7 red),(8 red)" on board
    And There already exists tiles of "(3 black),(4 black),(5 black),(6 black),(7 black),(8 black)" on board
    And Player has "(5 red),(6 red),(7 red),(8 red),(9 red)" in their hand
    And Board is valid
    And Player sends a command for splitting row 1 at index 2
    And Player sends a command for giving tiles of "(5 red)" to row 1
    And Player sends a command for splitting row 2 at index 3
    And Player sends a command for placing tiles of "(7 red),(8 red),(9 red)" on board
    And Board is valid
    And There are 1 total turns
    And Player sends a command for ending current turn
    Then There are 2 total turns
    And Board is valid

  @playTurnRecursiveCategory3_7
  Scenario: Play Turn - It is the player's turn, player splits a row, undoes their turn, then ends their turn
    Given New game is started
    When It is player's turn
    And Player's first placement is done
    And There are 1 total turns
    And There already exists tiles of "(3 red),(4 red),(5 red),(6 red),(7 red),(8 red)" on board
    And There already exists tiles of "(3 black),(4 black),(5 black),(6 black),(7 black),(8 black)" on board
    And Player has "(5 red),(6 red),(7 red),(8 red),(9 red)" in their hand
    And Board is valid
    And Player sends a command for splitting row 1 at index 2
    And Player sends a command for undoing the previous action
    And Board is valid
    And There are 1 total turns
    And Player has 5 tiles
    And Player sends a command for ending current turn
    Then There are 2 total turns
    And Board is valid
    And Player has 6 tiles

  @playTurnRecursiveCategory3_9
  Scenario: Play Turn - It is the player's turn, splits a row, undoes their turn, splits another row, places tiles on board, then ends their turn
    Given New game is started
    When It is player's turn
    And Player's first placement is done
    And There are 1 total turns
    And There already exists tiles of "(3 red),(4 red),(5 red),(6 red),(7 red),(8 red)" on board
    And There already exists tiles of "(3 black),(4 black),(5 black),(6 black),(7 black),(8 black)" on board
    And Player has "(5 red),(6 red),(7 red),(8 red),(9 red)" in their hand
    And Board is valid
    When Player sends a command for splitting row 1 at index 2
    And Player sends a command for undoing the previous action
    And Player sends a command for splitting row 1 at index 3
    And Player sends a command for placing tiles of "(7 red),(8 red),(9 red)" on board
    And Board is valid
    And There are 1 total turns
    And Player sends a command for ending current turn
    Then There are 2 total turns
    And Board is valid

  @Recursive_Category_3-1
  Scenario: PlayTurn - player places tiles on board, undoes the change, then finishes turn and draw a tile
    Given New game is started
    And It is player's turn
    And Player's first placement is done
    And There are 1 total turns
    And Player has "(5 red),(7 red),(9 red)" in their hand
    When Player sends a command for placing tiles of "(5 red),(7 red),(9 red)" on board
    And Player sends a command for undoing the previous action
    And Player sends a command for ending current turn
    Then There are 2 total turns
    And Player draws tile(s) from the deck so player has 4 tiles

  @Recursive_Category_3-2
  Scenario: PlayTurn - player places tiles on board, undoes the change, move tiles, places different tiles on board that form a run, then finishes turn
    Given New game is started
    And It is player's turn
    And Player's first placement is done
    And There are 1 total turns
    And There already exists tiles of "(3 red),(4 red),(5 red)" on board
    And There already exists tiles of "(6 red),(7 red),(8 red)" on board
    And Player has "(2 black),(2 red)" in their hand
    When Player sends a command for giving tiles of "(2 black)" to row 1
    And Player sends a command for undoing the previous action
    And Player sends a command for moving row 2 indices "1 2 3" to row 1
    And Player sends a command for giving tiles of "(2 red)" to row 1
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @Recursive_Category_3-3
  Scenario: PlayTurn - player places tiles on board, undoes the change, split tiles, places different tiles on board that form a run, then finishes turn
    Given New game is started
    And It is player's turn
    And Player's first placement is done
    And There are 1 total turns
    And There already exists tiles of "(3 black),(4 black),(5 black),(6 black),(7 black)" on board
    And Player has "(8 black),(11 red)" in their hand
    When Player sends a command for giving tiles of "(11 red)" to row 1
    And Player sends a command for undoing the previous action
    And Player sends a command for splitting row 1 at index 3
    And Player sends a command for giving tiles of "(8 black)" to row 2
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @Recursive_Category_3-4
  Scenario: PlayTurn - player places tiles on board, undoes the change, moves tiles, places different tiles on board that form a group, then finishes turn
    Given New game is started
    And It is player's turn
    And Player's first placement is done
    And There are 1 total turns
    And There already exists tiles of "(3 red),(3 blue),(3 yellow)" on board
    And There already exists tiles of "(3 black),(4 black),(5 black)" on board
    And Player has "(6 black),(11 red)" in their hand
    When Player sends a command for giving tiles of "(11 red)" to row 1
    And Player sends a command for undoing the previous action
    And Player sends a command for moving row 2 indices "1" to row 1
    And Player sends a command for giving tiles of "(6 black)" to row 2
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @Recursive_Category_3-5
  Scenario: PlayTurn - player places tiles on board, undoes the change, split tiles, places different tiles on board that form a group, then finishes turn
    Given New game is started
    And It is player's turn
    And Player's first placement is done
    And There are 1 total turns
    And There already exists tiles of "(3 black),(4 black),(5 black),(6 black)" on board
    And Player has "(6 red),(6 blue),(7 black)" in their hand
    When Player sends a command for giving tiles of "(7 black)" to row 1
    And Player sends a command for undoing the previous action
    And Player sends a command for splitting row 1 at index 3
    And Player sends a command for giving tiles of "(6 red),(6 blue)" to row 2
    And Board is valid
    And Player sends a command for ending current turn
    Then Board is valid
    And There are 2 total turns

  @Recursive_Category_3-6
  Scenario: PlayTurn - player split tiles, places tiles on board, undoes the change, then finishes turn and draw a tile
    Given New game is started
    And It is player's turn
    And Player's first placement is done
    And There are 1 total turns
    And There already exists tiles of "(3 black),(4 black),(5 black),(6 black)" on board
    And Player has "(5 red),(7 red),(9 red)" in their hand
    When Player sends a command for splitting row 1 at index 3
    And Player sends a command for giving tiles of "(5 red),(7 red),(9 red)" to row 2
    And Player sends a command for undoing the previous action
    And Player sends a command for ending current turn
    Then There are 2 total turns
    And Player draws tile(s) from the deck so player has 4 tiles
