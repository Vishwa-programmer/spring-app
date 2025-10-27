# Stage 1: build the JAR
# Use a specific Maven version (e.g., latest 3.x) with Temurin 21
FROM maven:3-eclipse-temurin-21 AS build
# OR, use a non-temurin tag if the above still fails: FROM maven:3-jdk-21 AS build

WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN mvn -B package -DskipTests

# Stage 2: runtime
# Use the JRE image for Temurin 21 (this tag is reliable)
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /build/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]