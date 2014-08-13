FEC Graph Search
================

Election data can be confusing. Searching through it, shouldn't be. 


## Getting Started
  1. Clone the repository `git clone ...`
  2. From the project root, install the necessary dependencies with `bundle install`.
  3. Start the web server with `rails s` and background processing with `bundle exec sidekiq`.
  4. Open the website at [localhost:3000](http://localhost:3000).


## Roadmap 

  - Find entities with natural language (eg. Contributors)
  - Show relationships with natural language (eg. have given money to, supported)
  - Find common relationships (eg. Contributors who have contributed to ____)

These are the initial mockups for the FEC graph search. Note the language of the search strings as well as the autocompletion for entities.
![FEC Mockups](https://cloud.githubusercontent.com/assets/582918/3690939/61117b26-134d-11e4-9a67-3e3eb0ed08b4.jpg)



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