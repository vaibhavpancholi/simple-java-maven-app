FROM maven:3.8.4-amazoncorretto-8 AS build
WORKDIR /usr/app
COPY . /usr/app
RUN mvn install

FROM openjdk:8-jdk-alpine
WORKDIR /
CMD ["java", "-jar", "/my-app-web-1.0-SNAPSHOT.jar"]
COPY --from=build /usr/app/target/my-app-web-1.0-SNAPSHOT.jar /
