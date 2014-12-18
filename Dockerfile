FROM fnubhupen/oraclejava:7
MAINTAINER Bhupendra Kumar <Bhupendra.kumar@softcrylic.com>

# Install tomcat
RUN apt-get update
RUN apt-get -y install tomcat7
RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/default/tomcat7

# Install maven
RUN apt-get update
RUN apt-get install -y maven

WORKDIR /code

# Prepare by downloading dependencies
ADD pom.xml /code/pom.xml
RUN ["mvn", "dependency:resolve"]
RUN ["mvn", "verify"]

# Adding source, compile and package into a fat jar
ADD src /code/src
RUN ["mvn", "package"]

# Define default command.
CMD ["bash"]
