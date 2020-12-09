@playTurnFeature
Feature: Testing user play a turn in various scenarios

  Scenario: Play Turn - places a tile and form a run, then finishes turn
    Given New game is started
    And Player starts round (not first placement)
    And There already exists a run of "(3 red),(4 red),(5 red)" on board
    And Player has "(6 red)" in their hand
    When Player sends a command for placing a tile of "(6 red)" on board
    And Placed tile form a run
    And Player sends a command for ending current turn
    Then Tiles placed on board successfully
    And Player ends a turn

  Scenario: Play Turn - places a tile and form a group, then finishes turn
    Given New game is started
    And Player starts round (not first placement)
    And There already exists a group of "(3 red),(3 blue),(3 black)" on board
    And Player has "(3 yellow)" in their hand
    When Player sends a command for placing a tile of "(3 yellow)" on board
    And Placed tile form a group
    And Player sends a command for ending current turn
    Then Tiles placed on board successfully
    And Player ends a turn

  Scenario: Play Turn - places multiple tiles and form a run together with existing tiles on board, then finishes turn
    Given New game is started
    And Player starts round (not first placement)
    And There already exists a run of "(3 red),(4 red),(5 red)" on board
    And Player has "(6 red),(7 red)" in their hand
    When Player sends a command for placing tiles of "(6 red),(7 red)" on board
    And Placed tiles form a run
    And Player sends a command for ending current turn
    Then Tiles placed on board successfully
    And Player ends a turn

  Scenario: Play Turn - places multiple tiles that form a run, then finishes turn
    Given New game is started
    And Player starts round (not first placement)
    And Player has "(3 red),(4 red),(5 red),(6 red)" in their hand
    When Player sends a command for placing a run of "(3 red),(4 red),(5 red),(6 red)" on board
    And Placed tiles form a run
    And Player sends a command for ending current turn
    Then Tiles placed on board successfully
    And Player ends a turn

  Scenario: Play Turn - places multiple tiles that form a group, then finishes turn
    Given New game is started
    And Player starts round (not first placement)
    And Player has "(3 red),(3 blue),(3 black),(3 yellow)" in their hand
    When Player sends a command for placing a group of "(3 red),(3 blue),(3 black),(3 yellow)" on board
    And Placed tiles form a group
    And Player sends a command for ending current turn
    Then Tiles placed on board successfully
    And Player ends a turn

  Scenario: Play Turn - places multiple tiles that form a run, and places multiple tiles that form another run, then finishes turn
    Given New game is started
    And Player starts round (not first placement)
    And Player has "(3 red),(4 red),(5 red),(8 blue),(9 blue),(10 blue)" in their hand
    When Player sends a command for placing a run of "(3 red),(4 red),(5 red)" on board
    And Placed tiles form a run
    And Player sends a command for placing a run of "(8 blue),(9 blue),(10 blue)" on board
    And Placed tiles form another run
    And Player sends a command for ending current turn
    Then Tiles placed on board successfully
    And Player ends a turn

  Scenario: Play Turn - places multiple tiles that form a group, and places multiple tiles that form another group, then finishes turn
    Given New game is started
    And Player starts round (not first placement)
    And Player has "(3 red),(3 blue),(3 black),(8 blue),(8 black),(8 yellow)" in their hand
    When Player sends a command for placing a group of "(3 red),(3 blue),(3 black)" on board
    And Placed tiles form a group
    And Player sends a command for placing a group of "(8 blue),(8 black),(8 yellow)" on board
    And Placed tiles form another group
    And Player sends a command for ending current turn
    Then Tiles placed on board successfully
    And Player ends a turn

  Scenario: Play Turn - places multiple tiles that form a group, and places multiple tiles that form a run, then finishes turn
    Given New game is started
    And Player starts round (not first placement)
    And Player has "(3 red),(3 blue),(3 black),(8 blue),(9 blue),(10 blue)" in their hand
    When Player sends a command for placing a group of "(3 red),(3 blue),(3 black)" on board
    And Placed tiles form a group
    And Player sends a command for placing a run of "(8 blue),(9 blue),(10 blue)" on board
    And Placed tiles form another run
    And Player sends a command for ending current turn
    Then Tiles placed on board successfully
    And Player ends a turn

  Scenario: Play Turn - places multiple tiles but it is an invalid placement, undo and places other tiles that form a run, then finishes turn
    Given New game is started
    And Player starts round (not first placement)
    And Player has "(3 red),(5 blue),(7 black),(8 blue),(9 blue),(10 blue)" in their hand
    When Player sends a command for placing tiles of "(3 red),(5 blue),(7 black)" but fails
    And Player sends a command for undoing the previous action
    And Player sends a command for placing another run of "(8 blue),(9 blue),(10 blue)" on board
    And Secondly placed tiles form a run
    And Player sends a command for ending current turn
    Then Player has 3 tiles
    And Player ends a turn

  Scenario: Play Turn - places multiple tiles but it is an invalid placement, undo and places other tiles that form a group, then finishes turn
    Given New game is started
    And Player starts round (not first placement)
    And Player has "(3 red),(5 blue),(7 black),(8 blue),(8 red),(8 yellow)" in their hand
    When Player sends a command for placing tiles of "(3 red),(5 blue),(7 black)" but fails
    And Player sends a command for undoing the previous action
    And Player sends a command for placing another group of "(8 blue),(8 red),(8 yellow)" on board
    And Secondly placed tiles form a group
    And Player sends a command for ending current turn
    Then Player has 3 tiles
    And Player ends a turn

  Scenario: Play Turn - places a tile but it is an invalid placement, undo and places another tile that form a run, then finishes turn
    Given New game is started
    And Player starts round (not first placement)
    And There already exists a run of "(3 red),(4 red),(5 red)" on board
    And Player has "(1 black),(6 red)" in their hand
    When Player sends a command for placing a tile of "(1 black)" but fails
    And Player sends a command for undoing the previous action
    And Player sends a command for placing another tile of "(6 red)" on board
    And Secondly placed tile form a run
    And Player sends a command for ending current turn
    Then Player has 1 tile
    And Player ends a turn

  Scenario: Play Turn - places a tile but it is an invalid placement, undo and places another tile that form a group, then finishes turn
    Given New game is started
    And Player starts round (not first placement)
    And There already exists a group of "(8 blue),(8 red),(8 yellow)" on board
    And Player has "(1 black),(8 black)" in their hand
    When Player sends a command for placing a tile of "(1 black)" but fails
    And Player sends a command for undoing the previous action
    And Player sends a command for placing another tile of "(8 black)" on board
    And Secondly placed tile form a group
    And Player sends a command for ending current turn
    Then Player has 1 tile
    And Player ends a turn

  Scenario: Play Turn - splits tiles and places a tile to form a run
    Given New game is started
    And Player starts round (not first placement)
    And There already exists a run of "(3 red),(4 red),(5 red),(6 red),(7 red)" on board
    And Player has "(8 red)" in their hand
    When Player sends a command for splitting tiles of "(6 red),(7 red)" into a new row
    And Player sends a command for placing a tile of "(8 red)" together with splitted tiles
    And There has a new run on board
    And Player sends a command for ending current turn
    Then Tiles placed on board successfully
    And Player ends a turn

  Scenario: Play Turn - splits tiles and places multiple tiles to form a run
    Given New game is started
    And Player starts round (not first placement)
    And There already exists a run of "(3 red),(4 red),(5 red),(6 red)" on board
    And Player has "(7 red),(8 red)" in their hand
    When Player sends a command for splitting a tile of "(6 red)" into a new row
    And Player sends a command for placing tiles of "(7 red),(8 red)" together with splitted tiles
    And There has a new run on board
    And Player sends a command for ending current turn
    Then Tiles placed on board successfully
    And Player ends a turn

  Scenario: Play Turn - splits tiles and places a tile with them to form a group
    Given New game is started
    And Player starts round (not first placement)
    And There already exists a run of "(3 red),(4 red),(5 red),(6 red),(7 red)" on board
    And Player has "(8 red)" in their hand
    When Player sends a command for splitting tiles of "(6 red),(7 red)" into a new row
    And Player sends a command for placing a tile of "(8 black)" together with the second row
    And There has a new run on row 1
    And Player sends a command for ending current turn
    Then Tiles placed on board successfully
    And Player ends a turn

  Scenario: Play Turn - splits tiles from two rows, combine splitted tiles and places a tile with them to form a group
    Given New game is started
    And Player starts round (not first placement)
    And There already exists a run of "(3 red),(4 red),(5 red),(6 red)" on board
    And There already exists another run of "(3 blue),(4 blue),(5 blue),(6 blue)" on board
    And Player has "(6 black)" in their hand
    When Player sends a command for splitting a tile of "(6 red)" into a new row
    And Player sends a command for splitting the second tile of "(6 blue)" into a new row
    And Player sends a command for combining the second and third row and placing a tile of "(6 black)" together with the third row
    And There has a new group on row 2
    And Player sends a command for ending current turn
    Then Tiles placed on board successfully
    And Player ends a turn


  Scenario: Play Turn - move a run of tiles into another run to combine
    Given New game is started
    And Player starts round (not first placement)
    And There already exists a run of "(3 red),(4 red),(5 red)" on board
    And There already exists another run of "(6 red),(7 red),(8 red)" on board
    And Player sends a command for moving the first row into the second row to combine them
    And There has a run on row 0
    And Player sends a command for ending current turn
    Then Tiles placed on board successfully
