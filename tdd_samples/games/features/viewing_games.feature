# codecite 5star
Feature: Viewing games
  In order to be useful to potential game buyers
  I want a page listing all of the games with 5-star average ratings.
  
  Scenario: The 5-star games page
    Given a game exists called "Racko"
    And the game has a rating close to 5
    When I go to the five-star games page
    Then I should see "Racko"
    # codecite 5star
