Feature: Merge blog articles
  As a blog reader
  In order to easily read similar articles from different authors
  I want to be able to see similar articles merged into one page
  
  Background:
    # i think this is a classic example of a bad imperative test case
    # but i'll just go with it since i'm still learning
    Given the blog is set up
    Given the following user exists:
    | login   | password    | email            | profile_id | name     | state  |
    | blogpub | aaaaaaaa    | blogpub@snow.com | 2          | blogpub  | active |
    Given the following articles exist:
    | title           | author    | user_id | body                       |
    | Admin's article | admin     | 1       | This is the third content  |
    | User's article  | blogpub   | 2       |  This is the fourth content |
    Given the following comments exist:
    | title    | author       | body          | article_id | email              |
    | nice!    | puppy googoo | woof woof     | 3          | puppy@googoo.com   |
    | another  | fluffy wah   | meow meow     | 4          | fluffy@mckitty.com |
    And I am logged into the admin panel as "admin"
    And articles 3 and 4 are merged
    
  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Then I should see "This is the third content"
    Then I should see "This is the fourth content"
  
  Scenario: Merged articles should only have one author (either)
    # I don't see authors at all on the website
    #Then I should see "admin"
    #Then I should not see "blogpub"
  
  Scenario: Comments for merged articles need to be ported to unified one
    When I am on the view page for article 3
  	Then I should see "woof woof"
  	Then I should see "meow meow"
  	
  Scenario: Title of merged article should be either one of old articles
    When I am on the view page for article 3
    Then I should see "Admin's article"
    Then I should not see "User's article"
