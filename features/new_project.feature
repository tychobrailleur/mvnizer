Feature: Create a new Maven project

  In order to rapidly run a project
  As a user of Mvnizer
  I want to quickly create Maven projects

  Scenario: create a jar project
    Given a directory named "foo"
    When I run `mvnizer new com.weblogism:foonbar`
    Then the output should contain "success"
    And a file named "foonbar/pom.xml" should exist
    And "/project/groupId" in the xml file "foonbar/pom.xml" should be "com.weblogism"
    And "/project/artifactId" in the xml file "foonbar/pom.xml" should be "foonbar"
    And "/project/name" in the xml file "foonbar/pom.xml" should be "foonbar"
    And "/project/version" in the xml file "foonbar/pom.xml" should be "0.0.1-SNAPSHOT"
    And "/project/packaging" should not be in the xml file "foonbar/pom.xml"
    And a file named "foonbar/src/main/webapp/WEB-INF/web.xml" should not exist

  Scenario: create a war project
    Given a directory named "foo"
    When I run `mvnizer new com.weblogism:foonbar:war`
    Then the output should contain "success"
    And a file named "foonbar/pom.xml" should exist
    And "/project/groupId" in the xml file "foonbar/pom.xml" should be "com.weblogism"
    And "/project/artifactId" in the xml file "foonbar/pom.xml" should be "foonbar"
    And "/project/name" in the xml file "foonbar/pom.xml" should be "foonbar"
    And "/project/version" in the xml file "foonbar/pom.xml" should be "0.0.1-SNAPSHOT"
    And "/project/packaging" in the xml file "foonbar/pom.xml" should be "war"
    And a file named "foonbar/src/main/webapp/WEB-INF/web.xml" should exist
    
    Scenario: add the dependencies
      Given a directory named "foo"
      When I run `mvnizer new com.weblogism:foonbar`
      Then  "/project/dependencies/dependency/groupId" in the xml file "foonbar/pom.xml" should be "junit"
      And "/project/dependencies/dependency/artifactId" in the xml file "foonbar/pom.xml" should be "junit"
      And "/project/dependencies/dependency/version" in the xml file "foonbar/pom.xml" should be "4.10"
      And "/project/dependencies/dependency/scope" in the xml file "foonbar/pom.xml" should be "test"
