package com.example.helloworld

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RestController

@RestController
class HelloWorldController {

    private val logger: Logger = LoggerFactory.getLogger(HelloWorldController::class.java)

    @GetMapping("/hello")
    fun hello(): String {
        return "Hello, World!"
    }

    @PostMapping("/hello")
    fun helloPost(@RequestBody payload: String): String {
        logger.info("Received payload: $payload")
        return "You just called the POST method at '/hello'!\n"
    }
}