FROM maven AS package
WORKDIR /app
COPY . .
RUN mvn package
RUN mv target/*.jar App.jar

FROM eclipse-temurin:21-jdk-alpine
WORKDIR /build
COPY --from=package /app/App.jar .
ENTRYPOINT ["java", "-jar", "App.jar"]
EXPOSE 9090
