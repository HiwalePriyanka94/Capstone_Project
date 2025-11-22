# =========================
# Stage 1: Build with Maven
# =========================
FROM maven:3.8.4-eclipse-temurin-11-alpine AS build

# Set working directory
WORKDIR /app

# Copy Maven project files
COPY pom.xml .
COPY src ./src

# Build the project (skip tests for faster builds)
RUN mvn clean package -DskipTests

# =================================
# Stage 2: Runtime (Java 11 slim)
# =================================
FROM openjdk:11.0.3-jdk-slim-stretch

WORKDIR /app

# Copy the built JAR from the build stage
# Use wildcard to handle versioned JARs
COPY --from=build /app/target/*.jar app.jar

# Expose port 8080
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

