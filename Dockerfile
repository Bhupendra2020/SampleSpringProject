FROM fnubhupen/oraclejava:7
MAINTAINER Bhupendra Kumar <Bhupendra.kumar@softcrylic.com>

# Install tomcat
RUN apt-get -y install tomcat7
RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/default/tomcat7

# Install maven
RUN apt-get update
RUN apt-get install -y maven

#Expose the port 8080
EXPOSE 8080
