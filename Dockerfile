FROM openjdk:8

ENV MAVEN_VERSION 3.6.3

RUN curl -sSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

COPY . /data/spring-prometheus-demo
WORKDIR /data/spring-prometheus-demo

RUN ["mvn", "clean", "install"]

EXPOSE 8080

CMD ["java", "-jar", "target/spring-prometheus-demo-0.0.1-SNAPSHOT.jar"]
