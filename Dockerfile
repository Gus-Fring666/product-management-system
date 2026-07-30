FROM tomcat:9.0-jdk8-temurin

# remove default Tomcat sample apps
RUN rm -rf /usr/local/tomcat/webapps/*

# deploy this app as the ROOT webapp
COPY WebContent/ /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080
CMD ["catalina.sh", "run"]
