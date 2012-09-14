- Provide full or partial coordinates to define project coordinates. e.g. here are a list of valid values for mvnizer:

    blah
    blah:1.0.0-SNAPSHOT
    blah:war
    com.weblogism:blah
    com.weblogism:blah:1.0.0-SNAPSHOT
    com.weblogism:blah:war
- Depending on type of artifact (jar, war, etc.), generate appropriate pom and structure.
- Provide way to add dependency to pom given coordinates, e.g.:

    mvnizer add org.junit:junit:4.10
- Provide dependency search facility.
