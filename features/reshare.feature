@javascript
Feature: public repost
  In order to make Diaspora more viral
  As a User
  I want to reshare my friend's post

  Background:
    Given a user named "Bob Jones" with email "bob@bob.bob"
    And a user named "Alice Smith" with email "alice@alice.alice"
    And a user with email "bob@bob.bob" is connected with "alice@alice.alice"

  # should be covered in rspec, so testing that the post is added to
  # app.stream in jasmine should be enough coverage
  Scenario: When I reshare, it shows up on my profile page
    Given "bob@bob.bob" has a public post with text "reshare this!"
    And I sign in as "alice@alice.alice"

    And I preemptively confirm the alert
    And I follow "Reshare"
    And I wait for the ajax to finish
    And I wait for 2 seconds

    When I am on "alice@alice.alice"'s page
    Then I should see "reshare this!"
    Then I should see a ".reshare"
    And I should see "Bob"
