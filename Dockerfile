FROM eclipse-temurin:21
WORKDIR /app
COPY target/Complete-DevSecOps-CI-CD-Pipeline-1.0-SNAPSHOT.jar 
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
