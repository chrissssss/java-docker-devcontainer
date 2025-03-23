package com.example.helloworld

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

// Basic stub that's necessary for a Spring Boot application
@SpringBootApplication
class HelloWorldApplication

fun main(args: Array<String>) {
    runApplication<HelloWorldApplication>(*args)
}