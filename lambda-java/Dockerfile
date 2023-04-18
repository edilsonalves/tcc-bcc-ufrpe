FROM maven:3.9.0-amazoncorretto

WORKDIR /app
COPY . .

RUN cd /app/src
RUN mvn clean install
