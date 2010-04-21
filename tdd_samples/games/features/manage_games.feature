Feature: Manage games
  In order to keep up with new game inventions
  I want to create new games using a form.
  
  Scenario: Creating a game
    Given I am on the games page
    And I follow "New game"
    When I fill in "Name" with "Parcheesi"
    And I fill in "Min players" with "2"
    And I fill in "Max players" with "4"
    And I fill in "Average hours" with "1"
    And I press "Create"
    Then I should see "Game was successfully created."
