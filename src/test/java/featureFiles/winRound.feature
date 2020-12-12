@winRoundFeature
Feature: winRoundFeature, Players can win rounds by emptying their hand or having the least tiles when deck is empty. A player the entire game if they pass the gameEndingScore

  @winRound-1
  Scenario: checking get winner and points functionality
    Given New game is started
    And New game is started with 3 players
    When Player 1 has placed all tiles
    And Player 2 has "(7 yellow),(11 blue),(5 red)" in their hand
    And Player 3 has "(6 red),(9 blue),(0 Joker)" in their hand
    Then Player 1 wins the round with score 68 points
    And Player 2 finishes the round with -23 points
    And Player 3 finishes the round with -45 points