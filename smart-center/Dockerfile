FROM livingobjects/jre8
VOLUME /tmp
ADD ./target/smart-center-0.0.1-SNAPSHOT.jar app.jar
#RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Xmx200m","-jar","/app.jar"]
EXPOSE 8761