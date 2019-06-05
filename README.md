# UCC Netsoc Developer Environment

Welcome to the UCC Netsoc Dev Env and thanks for wanting to contribute to our services :)

## Prerequisites

- docker
- docker-compose

## Getting Started

All services in the dev-env are docker-compose based.
We have a single simple script to take care of starting, stopping etc services and their backing services called `dev-env` in the root of this repository.  

It takes multiple arguments:  

1. The main component to act upon. The names for each are the names of the folders (excluding `./backing-services`)
2. Additional docker-compose arguments, with at least one needed eg `up`, `stop`, etc

Example to start netsoc-admin  
`./dev-env nsa up`  

This will launch netsocadmin and its necessary backing services as defined in the `docker-compose.yml` file in the `nsa` folder.

Below we will outline how to work on a Netsoc service locally in conjunction with the dev-env.

## Developing Locally

When developing locally, you will want to mount your local code into the specific docker container so that your locally changed code is integrated with the backing services and testable. This can be done by modifying the appropriate `docker-compose.override.yml` file.

Example `./nsa/docker-compose.override.yml`:

```yaml
version: '3.7'
services:
  nsa:
    volumes:
      # Mounts your local code into the container so that your code is run instead
      - /path/to/local/netsocadmin:/netsocadmin/netsocadmin
    ports:
      # You can change the port mappings if you want
      - 5051:5050

```

## Useful commands

| Command                       | Description                  | Notes |
| ------------------------------| ---------------------------- | ----- |
| `./dev-env <service> up`        | Starts \<service\> and prints its logs in real-time               | |
| `./dev-env <service> up -d`        | Starts \<service\>               | |
| `./dev-env <service> ps`           | Show running containers      | |
| `./dev-env <service> logs -f`      | See all logs                 | |
| `./dev-env <service> logs -f <service2>` | Logs for one component. \<service2\> can include backing services        | |
| `./dev-env <service> exec <service2> sh` | Start shell inside container | Changes are not persisted on restarts! |
| `./dev-env <service> stop`         | Stop everything (keep data)  | |
| `./dev-env <service> down`         | Stop and **remove** data | **This will reset any non persisted data!** |
| `./dev-env <service> pull`         | Pull latest images           | |

## Auth

Two accounts exists in LDAP:

| Username | Password | Role |
|----------|----------|------|
| john | johns-password | admin |
| sofia | sofias-password | member |

These logins will work for the local MySQL database as well.
Simply run `mysql -h '127.0.0.1' -P 3306 -u <user> -p` and input the respective password

## Configuration Storage

We use Hashicorp Consul and Vault to store configuration and sensitive secrets.
Where possible going forward, these should be used in services.

Locally, both have a user facing UI:

- Consul: http://127.0.0.1:8200/ui
- Vault: http://127.0.0.1:8500/ui

Vault requires authentication. You can login with `john` as above with LDAP method or else with the Token method, the token being `netsoc`. 

**NOTE** that Vault will clear all saved secrets on startup. Make use of default settings in your services that allow the service to run in dev-env without relying on Vault and use Vault for testing that your program will work with Vault.

## Adding a Service

1. Create a folder with the name of the service as will be passed as the argument to the `dev-env` script
2. Add a `docker-compose.yml` file in the folder
    - This defines the dev-env tagged image, port mappings and the components backing services in a `depends_on` section.
3. Try it out and open a PR for review : )

### TODO

1. More docs?