FROM maven:3.8.6-openjdk-8 as builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline || true
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:8-jre
WORKDIR /app
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
COPY --from=builder /app/target/newbee-mall-1.0.0-SNAPSHOT.jar app.jar
EXPOSE 28089
ENTRYPOINT ["java", "-jar", "app.jar"]
