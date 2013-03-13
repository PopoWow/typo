Feature: Try to merge blog articles as a non-admin
  As a non-admin blog publisher
  In order combine similar stories
  I want to merge another article with mine but shouldn't be able to

  Background:
    Given the blog is set up
    Given the following user exists:
    | login   | password    | email            | profile_id | name     | state  |
    | blogpub | aaaaaaaa    | blogpub@snow.com | 2          | blogpub  | active |
    Given the following article exists:
    | title           | author    | body                        |
    | User's article  | blogpub   | Written by a non-admin id 3 |
    And I am logged into the admin panel as "blogpub"

  Scenario: A non-admin cannot merge two articles
    Given I am on the edit page for article 3
    Then I should not see "Merge Articles"
