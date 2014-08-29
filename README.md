FEC Graph Search
================

Election data can be confusing. Searching through it, shouldn't be. 

[![Build Status](https://travis-ci.org/18F/fec-graph-search.svg?branch=develop)](https://travis-ci.org/18F/fec-graph-search)
[![Code Climate](https://codeclimate.com/github/18F/fec-graph-search/badges/gpa.svg)](https://codeclimate.com/github/18F/fec-graph-search)
[![Test Coverage](https://codeclimate.com/github/18F/fec-graph-search/badges/coverage.svg)](https://codeclimate.com/github/18F/fec-graph-search)

![Screenshot](http://18f.github.io/fec-graph-search/public/screenshot.png)
![Screenshot](http://18f.github.io/fec-graph-search/public/screenshot-graph.png)


## Getting Started
  1. Clone the repository `git clone git@github.com:18F/fec-graph-search.git`
  2. From the project root, install the necessary dependencies with `bundle install`.
  3. Spin up Neo4j with the [Neo4j docker container](https://github.com/amoose/docker-neo4j): `vagrant up --provider=docker` (from the docker-neo4j project root). Or, install Neo4j locally with `rake neo4j:install` and `rake neo4j:start`. 
  4. Copy the example files with `cp config/database.yml.example config/database.yml && cp .env.example .env` and update values as necessary.
  4. Start the application with `foreman start`. 
  5. Open the website at [localhost:4000](http://localhost:4000).


## Dependencies

 - Ruby 2 and bundler - [rbenv](https://github.com/sstephenson/rbenv) or [RVM](http://rvm.io/)
 - [Neo4j](http://www.neo4j.org/)
   - You can install with the included gem via `rake neo4j:install` or try a Docker container launched with Vagrant for instant provisioning, aptly named [docker-neo4j](https://github.com/amoose/docker-neo4j).
 - [Redis](http://redis.io/) - `brew install redis`
 - [Postgres](http://postgresapp.com)




## More Information

This is an experiment in making sense of the data provided by the [Federal Election Commission](http://www.fec.gov).

**Note:** This project is still in alpha and may never be deployed. We're still investigating the best ways to present this data to the public.

#### The Philosophy

Generate relevant views of FEC data based on real-world search scenarios. 

#### The Solution



  - Employ a Neo4j graph database and populate with [massaged data](https://github.com/18f/openfec#openfec) to represent our domain entities and their relationships.
  - Parse query strings using [Treetop](https://github.com/nathansobo/treetop) to define a _parsing expression grammar:_
    - _Treetop will generate a Ruby parser that transforms streams of characters written into your language into abstract syntax trees representing their structure. You'll then describe the semantics of your language in Ruby by defining methods on the syntax trees the parser generates._
  - Generate useful output of tabular, graphic and qualitative data. 


#### Roadmap 

  - ~~Find entities with natural language (eg. Contributors)~~
  - ~~Show relationships with natural language (eg. have given money to, supported)~~
  - ~~Add Travis-CI~~
  - Find common relationships (eg. Contributors who have contributed to ____)
  - Typeahead and autocompletion
  - Visualizations eg. [Timeseries](http://c3js.org/samples/timeseries.html)




## Credits

Huge thanks to [Max DeMarzi](https://github.com/maxdemarzi) for his continued work with [Neo4j](http://www.neo4j.org/) and its community. The [Neo Graph Search](https://github.com/maxdemarzi/neo_graph_search) proof of concept was the initial inspiration for FEC Graph Search. 



## Contributing

Please read the [Contribution Guide](CONTRIBUTING.md) and submit a pull request.



## License

[The project is in the public domain](LICENSE.md), and all contributions will also be released in the public domain. By submitting a pull request, you are agreeing to waive all rights to your contribution under the terms of the [CC0 Public Domain Dedication](http://creativecommons.org/publicdomain/zero/1.0/).

This project constitutes an original work of the United States Government.
