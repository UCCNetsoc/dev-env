# UCC Netsoc Developer Environment

Welcome to the UCC Netsoc Dev Env and thanks for wanting to contribute to our services :)

## Getting Started

All services in the dev-env are docker-compose based.
We have a single simple script to take care of starting, stopping etc services and their backing services called `dev-env` in the root of this repository.  

It takes multiple arguments:  

1. The main component to act upon. The names for each are the names of the folders (excluding `./backing-services`)
2. Additional docker-compose arguments, with at least one needed eg `up`, `stop`, etc

Example to start netsoc-admin  
`./dev-env nsa up`  

This will launch netsocadmin and its necessary backing services as defined in the `docker-compose.yml` file in the `nsa` folder.

## Adding a Service

1. Create a folder with the name of the service as will be passed as the argument to the `dev-env` script
2. Add a `docker-compose.yml` file in the folder
    - This defines the dev-env tagged image, port mappings and the components backing services in a `depends_on` section.
3. Try it out and open a PR for review : )

### TODO

1. Make pre-prepared LDAP container
2. Allow docker-compose.override.yml and doc it
3. More docs?