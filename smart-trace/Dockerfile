FROM livingobjects/jre8
VOLUME /tmp
ADD ./target/smart-trace-1.0.0.jar app.jar
#RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Xmx200m","-jar","/app.jar"]
EXPOSE 9411