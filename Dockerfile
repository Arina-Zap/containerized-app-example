FROM alpine:3.13.5

RUN apk --no-cache add openjdk11

RUN mkdir /opt/spring-boot-helloworld
WORKDIR /opt/spring-boot-helloworld
COPY target/hello-world-0.0.1-SNAPSHOT.jar /opt/spring-boot-helloworld/

ENTRYPOINT ["java", "-jar", "/opt/spring-boot-helloworld/hello-world-0.0.1-SNAPSHOT.jar"]