Feature: Create a new Maven project

  In order to rapidly run a project
  As a user using Mvnizer
  I want to quickly create Maven projects

  Scenario: create a jar project
    Given a directory named "foo"
    When I run `mvnizer new com.weblogism:foonbar`
    Then the output should contain "success"
    And a file named "foonbar/pom.xml" should exist
    And a file named "foonbar/src/main/webapp/WEB-INF/web.xml" should not exist

  Scenario: create a war project
    Given a directory named "foo"
    When I run `mvnizer new com.weblogism:foonbar:war`
    Then the output should contain "success"
    And a file named "foonbar/pom.xml" should exist
    And a file named "foonbar/src/main/webapp/WEB-INF/web.xml" should exist
