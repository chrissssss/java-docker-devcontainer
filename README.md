# Spring Boot Hello World REST service

## Projektbeschreibung
Hello World REST Service Template setup as devcontainer using Spring Boot 3.4.3

## Development
Clone the repo and run as devcontainer. 

## Build and run

1. Test and build the project with Maven:
    ```bash
    mvn clean install
    ```
2. Start the Spring Boot application:
    ```bash
    mvn spring-boot:run
    ```
3. Build the container
    ```bash
    docker build -t spring-boot-application .
    ```
4. Run the container
    ```bash
    docker run -p 8080:8080 spring-boot-application
    ```