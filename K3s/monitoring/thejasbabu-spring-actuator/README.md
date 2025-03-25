# Spring boot actuator

A Simple Spring boot application making use of spring-actuator and micrometer-prometheus to emit prometheus JVM metrics of the application.

## Steps to build

1. Run maven package command to generate the package  
    `mvn clean package`
2. Build the docker image  
    `docker build  .`
3. Run the docker image  
    `docker run -d -p 4001:4001 -p 8080:8080 <image-id>`

One should be able to hit the `http://localhost:4001/actuator/prometheus` and get JVM metrics in prometheus format.  