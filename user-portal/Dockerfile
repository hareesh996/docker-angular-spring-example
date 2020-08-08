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
COPY ./user-portal opt/app/maven/projects/user-portal/
WORKDIR opt/app/maven/projects/user-portal
RUN mvn clean package -DskipTests;
#CMD java -jar ${artifact}.jar
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh
