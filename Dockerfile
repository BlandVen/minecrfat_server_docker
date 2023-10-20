FROM ubuntu:20.04

WORKDIR /home 

RUN apt-get update 
RUN apt-get install -y openjdk-17-jdk
RUN apt-get install -y wget
RUN wget -P /home https://piston-data.mojang.com/v1/objects/5b868151bd02b41319f54c8d4061b8cae84e665c/server.jar

COPY eula.txt .
COPY server.properties .

CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"] 

EXPOSE 25565
