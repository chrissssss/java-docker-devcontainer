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

### Workflow Steps

1. **Checkout repository**: Checks out the repository to the GitHub runner.
2. **Set up JDK 21**: Sets up JDK 21 using the `actions/setup-java` action.
3. **Build with Maven**: Builds the project using the `bin/build.sh` script.
4. **Log in to GitHub Container Registry**: Logs in to GHCR using the `docker/login-action`.
5. **Build Docker image**: Builds the Docker image using the `bin/docker-build.sh` script.
6. **Push Docker image to GHCR**: Pushes the Docker image to GitHub Container Registry.

The workflow is triggered on pushes and pull requests to the `main` branch.

You can view the workflow file [here](.github/workflows/build-and-deploy.yml).
