Bootstraps a Maven project.  Because archetypes shouldn't be so complicated.

[![Build Status](https://travis-ci.org/tychobrailleur/mvnizer.svg?branch=master)](https://travis-ci.org/tychobrailleur/mvnizer)

# Introduction

Mvnizer is ideal to create a throw-away Maven project that adds junit as a dependency and sets up the Maven project structure.

# Install

Mvnizer can be installed as follows:

    $ gem install mvnizer

# Commands

## Project Creation

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

## Add Dependency

To add dependencies, you must be in the folder where the pom file you want to add the dependency to is.

To add a dependency, simply pass the coordinates of the dependency, and add scope if needed (if no scope is given, `compile` is assumed):

    mvnizer add org.apache.commons:commons-lang3:3.1:jar
    mvnizer add org.mockito:mockito-core:1.9.5-rc1:jar:test

The `search` features makes it easy to find the coordinates of the dependencies for you.


## Dependency Search

You can search for dependencies in the Maven central repository with the command:

    $ mvnizer search <text>



# License

MIT License.

© Copyright 2012,2015 – Sébastien Le Callonnec
