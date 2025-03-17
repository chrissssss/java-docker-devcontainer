# Spring Boot Hello World REST service

## Project description
Hello World REST Service Template setup as devcontainer using Spring Boot 3.4.3

## Development
Clone the repo and run as devcontainer. 

## Build and run

1. Build (and test) the project with Maven:
    ```bash
    bin/build.sh
    ```
2. Only run the tests:
    ```bash
    bin/test.sh
    ```
3. Start the Spring Boot application:
    ```bash
    bin/run.sh
    ```
4. Build the container:
    ```bash
    bin/docker-build.sh
    ```
5. Run the container:
    ```bash
    bin/docker-run.sh
    ```

## CI/CD with GitHub Actions

This project uses GitHub Actions to automate the build and deployment process. The workflow is defined in `.github/workflows/build-and-deploy.yml`.

The workflow is triggered on pushes and pull requests to the `main` branch.

You can view the workflow file [here](.github/workflows/build-and-deploy.yml).

## Issues
- [ ] Maven build should be run with -B (MVN_ARGS?) to declutter logs
- [ ] Why does the trigger not run?
- [ ] Compare imagesize and switch to https://github.com/MrGraversen/minimal-jre-21-spring-boot-3-demo/blob/develop/MinimalJRE21.Dockerfile minimal build using temurine
- [ ] Use caching as described here  https://www.baeldung.com/ops/docker-cache-maven-dependencies
