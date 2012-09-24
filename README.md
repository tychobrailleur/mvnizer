Bootstraps a Maven project.  Because archetypes shouldn't be so complicated.

# Introduction

Mvnizer is ideal to create a throw-away Maven project that adds junit as a dependency and sets up the Maven project structure.

# Command

Mvnizer is used as follows:

    $ mvnizer new <coordinates>

The coordinates can have the following format:

    <group:>artifact<:version><:type>

with the values between angled brackets optional.  `type` can only have one of the following three values: `jar` (default), `war` or `pom`.  This command creates a project in the `artifact` folder, populating the proper values in the pom file.

Here are some examples of valid commands:

    mvnizer new foo
    mvnizer new foo:war
    mvnizer new foo:1.0:war
    mvnizer new com.example:foo
    mvnizer new com.example:foo:war
    mvnizer new com.example:foo:1.0:war


# License

MIT License. 
