FROM gradle:7-jdk-21-and-23-alpine as build
WORKDIR /app
COPY . .
RUN gradle build --no-daemon

FROM alpine/java:21-jdk

WORKDIR /app

COPY --from=build /app/build/libs/*.jar /app/notificacao.jar

EXPOSE 8083

CMD ["java","-jar","/app/notificacao.jar"]