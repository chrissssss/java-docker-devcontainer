# Spring Boot Hello World REST service

## Projektbeschreibung
Hello World REST Service Template setup as devcontainer using Spring Boot 3.4.3

## Development
Clone the repo and run as devcontainer. 

## Bauen und Starten
Um das Projekt zu bauen und zu starten, führen Sie die folgenden Befehle aus:

1. Bauen Sie das Projekt mit Maven:
    ```bash
    mvn clean install
    ```
2. Starten Sie die Spring Boot Anwendung:
    ```bash
    mvn spring-boot:run
    ```
3. Build the container
    ```bash
    docker build -t spring-boot-application .
    ```
