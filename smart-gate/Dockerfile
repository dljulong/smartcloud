FROM livingobjects/jre8
VOLUME /tmp
ADD ./target/smart-gate-0.0.1-SNAPSHOT.jar app.jar
ADD wait-for-it.sh /wait-for-it.sh
ENTRYPOINT ["java","-Xmx200m","-jar","/app.jar"]
EXPOSE 8888