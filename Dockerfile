FROM            openjdk
RUN             useradd java
USER            java
WORKDIR         /home/java
COPY            target/shipping-1.0.jar shipping.jar
ENTRYPOINT      [ "java", "-XX:MinRAMPercentage=80.0", "-XX:MaxRAMPercentage=90.0", "-jar", "shipping.jar" ]

###