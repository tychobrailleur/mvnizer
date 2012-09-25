# New Project

- Depending on type of artifact (jar, war, etc.), generate appropriate pom and structure.
- Add specific options to add classic dependencies / plugins:

    mvnizer new foo --slf4j
    mvnizer new foo --shade # adds the maven-shade-plugin, and possibly a Main class.
- Provide way to add dependency to pom given coordinates, e.g.:

    mvnizer add org.junit:junit:4.10
    
# Search
    
- Provide dependency search facility.

    mvnizer search junit
    

# Options    

- Support external config file (e.g. ~/.mvnizerrc) to override current defaults.
