# codecite homefeat
Feature: Home page
  In order that all parts of the app are accessible
  There should be a menu of links to index pages on the home page
  # codecite homefeat

  # codecite homegames
  Scenario: Show all games
    Given I am on the home page
    When I follow "Games"
    Then I should be on the games page
    # codecite homegames
    
  # codecite homeother
  Scenario: Show all reviews
    Given I am on the home page
    When I follow "Reviews"
    Then I should be on the reviews page
    
  Scenario: Show all users
    Given I am on the home page
    When I follow "Users"
    Then I should be on the users page
    # codecite homeother
