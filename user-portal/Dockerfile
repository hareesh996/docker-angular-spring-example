# docker build -t user-portal-learning:latest .

#FROM openjdk:8-jdk-alpine
## point to tmp directory where the app.jar file will be copied and application would be started.
#VOLUME /tmp
#ARG APP_JAR=user-portal-0.0.1-SNAPSHOT.jar
#COPY ./target/${APP_JAR} app.jar
## exposing the port 8080 on which user-portal application would be running.
#EXPOSE 8080
#ENTRYPOINT ["java", "jar","app.jar"]
#escape=`

#FROM ubuntu
#VOLUME D:/ubuntu-workspace
#RUN mkdir app
#COPY . /app/user-portal
FROM maven:3.6-openjdk-8 as maven

# all the maven projects would be copied into the maven folder.
# WORKDIR opt/app/maven/projects/user-portal
RUN pwd
# exposing the port 8080
EXPOSE 8080
COPY ./user-portal /user-portal
WORKDIR /user-portal
RUN mvn clean package -DskipTests;
ENV WAIT_VERSION 2.7.2
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait
RUN chmod +x /wait
CMD ["java -jar /target/user-portal.jar"]
#CMD java -jar target/user-portal.jar
# COPY wait-for-it.sh /wait-for-it.sh
# RUN chmod +x /wait-for-it.sh
