# Use Eclipse Temurin 11 JRE on Alpine (slim)
FROM eclipse-temurin:11-jre-alpine

# Set working directory
WORKDIR /app

# Copy the JAR built by Maven
COPY ./target/database_service_project-0.0.7.jar app.jar

# Expose Spring Boot port
EXPOSE 8080

# Run the JAR
ENTRYPOINT ["java","-jar","app.jar"]

