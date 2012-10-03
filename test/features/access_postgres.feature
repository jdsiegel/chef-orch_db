@postgres
Feature: Accessing a postgres database with a database user

In order to persist data for some application
As a developer
I want to be able to modify and query the postgres database created by this recipe

  Background:
    Given the database is postgres

  Scenario: Create a table
    When I create a new table
    Then the table should exist

  Scenario: Drop a table
    Given a table exists
    When I drop the table
    Then the table should not exist

  Scenario: Insert a row
    Given a table exists
    When I insert a row a table
    Then the row should exist in the table
