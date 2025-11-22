# Stage 1: Build stage
FROM maven:3.9.4-openjdk-11-slim AS build

WORKDIR /app
COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# Stage 2: Runtime stage
FROM openjdk:11.0.3-jdk-slim-stretch

WORKDIR /app
COPY --from=build /app/target/your-app.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]

