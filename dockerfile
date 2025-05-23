# Etapa 1: Build do projeto
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etapa 2: Rodar o WAR com Tomcat
FROM tomcat:9-jdk17
WORKDIR /app
COPY --from=build /app/target/frontmusics-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
