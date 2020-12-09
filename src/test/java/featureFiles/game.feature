@gameFeature
Feature: Testing for functions in Game Class


  Scenario: checking get winner and points functionality
    Given New game is started
    And New game is started with 3 players
    And Player1 has placed all tiles
    And Player2 has tiles "(7 yellow),(11 blue),(5 red)"
    And Player3 has tiles "(6 red),(9 blue),(0 Joker)"
    Then Player1 wins the round with score 68 points
    And Player2 finishes the round with -23 points
    And Player3 finishes the round with -45 points
