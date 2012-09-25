Feature: Search for a Maven artefact

  In order to easily find dependencies
  As a user of Mvnizer
  I want to search the Maven central repositories through the command line

  Scenario: search for log4j
    When I run `mvnizer search log4j`
    Then the output should contain "log4j:log4j:"
    And the output should contain "ant:ant-apache-log4j"

  Scenario: error message when no result
    
