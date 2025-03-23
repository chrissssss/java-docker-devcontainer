############################################################
# Step 1: Build-Phase (with Maven and OpenJDK)
############################################################

FROM ubuntu:20.04 AS build

# Set non-interactive frontend for apt-get to avoid regional settings prompt
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies: curl, maven, openjdk-21, git, binutils, and others
RUN apt-get update && apt-get install -y \
    curl \
    maven \
    openjdk-21-jdk-headless \
    git \
    binutils \
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

# Use jdeps to determine required Java modules
RUN jdeps --print-module-deps --ignore-missing-deps target/*.jar > jre-deps.info

# Generate a custom runtime image using jlink
RUN jlink \
    --module-path /usr/lib/jvm/java-21-openjdk-amd64/jmods \
    --add-modules $(cat jre-deps.info) \
    --output /custom-jre \
    --strip-debug \
    --no-man-pages \
    --no-header-files \
    --compress=2

############################################################
# Step 2: Runtime-Phase (with Distroless)
############################################################

FROM gcr.io/distroless/java21-debian12 AS runtime

# Copy the custom JRE from the build stage
COPY --from=build /custom-jre /custom-jre

# Set working directory for runtime environment
WORKDIR /usr/src/app

# Copy the built JAR from the build stage
COPY --from=build /usr/src/app/target/*.jar /usr/src/app/app.jar

# Use the custom JRE to run the application
ENV PATH="/custom-jre/bin:$PATH"

# Expose the port the Spring Boot app will run on
EXPOSE 8080

# Command to run the Spring Boot application
CMD ["java", "-jar", "app.jar"]
