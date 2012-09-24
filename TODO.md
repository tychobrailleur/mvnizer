- Depending on type of artifact (jar, war, etc.), generate appropriate pom and structure.
- Provide way to add dependency to pom given coordinates, e.g.:

    mvnizer add org.junit:junit:4.10
- Provide dependency search facility.

    mvnizer search junit
- Support external config file (e.g. ~/.mvnizerrc) to override current defaults.
