FROM            redhat/ubi9 AS newrelic_source
WORKDIR         /opt
RUN             dnf install unzip -y
RUN             curl -O https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip
RUN             unzip newrelic-java.zip


FROM            openjdk
RUN             useradd java
USER            java
WORKDIR         /home/java
COPY            target/shipping-1.0.jar shipping.jar
COPY            --from=newrelic_source /opt/newrelic/ /home/java/newrelic/
ENTRYPOINT      [ "java", "-XX:MinRAMPercentage=80.0", "-XX:MaxRAMPercentage=90.0", "-jar", "shipping.jar" ]

###