FEC Graph Search
================

Election data can be confusing. Searching through it, shouldn't be. 


![Screenshot](http://18f.github.io/fec-graph-search/public/screenshot.png)


## Getting Started
  1. Clone the repository `git clone git@github.com:18F/fec-graph-search.git`
  2. From the project root, install the necessary dependencies with `bundle install`.
  3. Start Neo4j with `rake neo4j:start` or boot a [docker container](https://github.com/amoose/docker-neo4j) with `vagrant up --provider=docker`
  4. Start the application with `foreman start`. 
  5. Open the website at [localhost:4000](http://localhost:4000).



## Roadmap 

  - Find entities with natural language (eg. Contributors)
  - Show relationships with natural language (eg. have given money to, supported)
  - Find common relationships (eg. Contributors who have contributed to ____)
  - Add Travis-CI




## Dependencies

 - Ruby 2 and bundler
 - Neo4j
   - You can install with the included gem via `rake neo4j:install` or try a Docker container launched with Vagrant for instant provisioning, aptly named [docker-neo4j](https://github.com/amoose/docker-neo4j).
 - Redis



## Credits

Huge thanks to [Max DeMarzi](https://github.com/maxdemarzi) for his continued work with [Neo4j](http://www.neo4j.org/) and its community. The [Neo Graph Search](https://github.com/maxdemarzi/neo_graph_search) proof of concept was the initial inspiration for FEC Graph Search. 



## Contributing

Please read the [Contribution Guide](CONTRIBUTING.md) and submit a pull request.



## License

[The project is in the public domain](LICENSE.md), and all contributions will also be released in the public domain. By submitting a pull request, you are agreeing to waive all rights to your contribution under the terms of the [CC0 Public Domain Dedication](http://creativecommons.org/publicdomain/zero/1.0/).

This project constitutes an original work of the United States Government.