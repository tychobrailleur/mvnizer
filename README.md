Bootstraps a Maven project.  Because archetypes shouldn't be so complicated.

# Introduction

Mvnizer is ideal to create a throw-away Maven project that adds junit as a dependency and sets up the Maven project structure.

# Command

Mvnizer is used as follows:

    $ mvnizer <coordinates>

The coordinates can have the following format:

    <group:>artifact<:version><:type>

with the values between angled brackets optional.  `type` can only have one of the following three values: `jar` (default), `war` or `pom`.

This command creates a project in the `artifact` folder, populating the proper values in the pom file.

# License

MIT License. 