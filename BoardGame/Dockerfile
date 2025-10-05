# Use OpenJDK as base image
FROM openjdk:11-jre-slim

# Set working directory in container
WORKDIR /app

# Copy the JAR built by Maven
COPY target/database_service_project-0.0.7.jar app.jar

# Expose the port Spring Boot runs on
EXPOSE 8080

# Run the JAR
ENTRYPOINT ["java","-jar","app.jar"]
