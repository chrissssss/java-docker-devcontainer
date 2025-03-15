############################################################
# Step 1: Build-Phase (with Maven und OpenJDK)
############################################################

FROM ubuntu:20.04 AS build

# Set non-interactive frontend for apt-get to avoid regional settings prompt
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies: curl, maven, openjdk-21, git and others
RUN apt-get update && apt-get install -y \
    curl \
    maven \
    openjdk-21-jdk-headless \
    git \
    && apt-get clean

# Set working directory
WORKDIR /usr/src/app

# Copy the pom.xml first to leverage Docker cache
COPY pom.xml .

# Download Maven dependencies (this caches dependencies)
RUN mvn dependency:go-offline

# Copy the source code
COPY src ./src

# Build the Spring Boot application
RUN mvn clean install

############################################################
# Step 2: Runtime-Phase (with OpenJDK)
############################################################

FROM ubuntu:20.04 AS runtime

# Set non-interactive frontend for apt-get to avoid regional settings prompt
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies: curl, maven, openjdk-21, git and others
RUN apt-get update && apt-get install -y \
    openjdk-21-jre-headless \
    && apt-get clean

# Set working directory for runtime environment
WORKDIR /usr/src/app

# Copy the built JAR from the build stage
COPY --from=build /usr/src/app/target/*.jar /usr/src/app/app.jar

# Expose the port the Spring Boot app will run on
EXPOSE 8080

# Command to run the Spring Boot application
CMD ["java", "-jar", "app.jar"]
