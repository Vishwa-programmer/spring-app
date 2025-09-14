# Stage 1: Build the application
FROM maven:3.9.4-openjdk-21-slim AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Create the runtime image
FROM openjdk:21-jdk-slim
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]