Feature: Add and edit categories
  As a blog admin
  In order to create categories to group content
  I want to be able to create new and edit existing categories
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel as "admin"

  Scenario: I can create a new category
    Given I am on the new category page
    When I fill in "category_name" with "Kittens"
    And I fill in "category_permalink" with "kittens"
    And I press "Save"
    Then I should be on the new category page
    And I should see "Kittens"
    
  Scenario: I can edit an existing category
    Given the following category exists:
    | name    | permalink | description   |
    | Puppies | puppies   | This has ID 2 |

	# path is categories even though this is grammatically incorrect
    And I am on the edit page for category 2
    When I fill in "category_name" with "Kittens"
    And I fill in "category_permalink" with "kittens"
    And I press "Save"
    Then I should be on the new category page
    And I should see "Kittens"
    And I should not see "Puppies"
    
    