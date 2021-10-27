spring-prometheus-demo
===

This is a simple example of how you can export both custom and default Spring Boot Actuator metrics in a way that Prometheus can scrape and gather.


 
```
sudo apt install openjdk -y
sudo apt install maven -y
sudo apt install default-jdk -y
sudo apt install docker.io -y
```

To generate the Jar File (Artifact)

```
 mvn clean install
```



The application can be ran with:


```
./mvnw spring-boot:run
```



 Building the docker Image

```
docker build -t mohankrishna225/springboot-prometheus:2.0 .
```

 Check if the Image is working properly
 
```
  docker run -it mohankrishna225/springboot-prometheus:2.0
```

   Push it to Dockerhub or ttl.sh
   
```
docker push mohankrishna225/springboot-prometheus:2.0
```



```
kubectl create -f deploy.yaml
```



And the Prometheus metrics are available at http://localhost:8080/actuator/prometheus

This demo also uses a custom counter to track visits named `visit_counter_total`. This is increased every time a GET request is made to `/`.
