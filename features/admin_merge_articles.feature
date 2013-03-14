Feature: Merge blog articles
  As a blog administrator
  In order combine similar stories
  I want to merge one article with another
  
  Background:
    Given the blog is set up
    Given the following article exists:
    | title           | author    | body                   |
    | Admin's article | admin     | This article has id 3  |
    And I am logged into the admin panel as "admin"
  
  Scenario: An admin should be able to merge articles
    Given I am on the edit page for article 3
    Then I should see "Merge Articles"

  Scenario: blog id entry field should have the attribute name: "merge_with"
    Given I am on the edit page for article 3
    #Then I should see 
    
  
  
