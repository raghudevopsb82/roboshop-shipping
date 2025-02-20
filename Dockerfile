FROM            openjdk
RUN             useradd java
USER            java
WORKDIR         /home/java
COPY            target/shipping-1.0.jar shipping.jar
ENTRYPOINT      [ "java", "-jar", "shipping.jar" ]

