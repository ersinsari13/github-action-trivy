FROM maven:3.9.0-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests=true

FROM amazoncorretto:17-alpine3.18
WORKDIR /app
COPY --from=builder /app/target/*.jar /app.jar
ENV SPRING_PROFILES_ACTIVE=mysql
EXPOSE 8080
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]