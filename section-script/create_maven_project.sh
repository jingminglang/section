#!/bin/bash


# create by: jimila
# use to create maven multiple module projecct 
# need install xmlstarlet : sudo apt install xmlstarlet



# set project name
groupId="com.v5b7"
app="javaDraft"

# create parent project
mvn archetype:generate -DgroupId=${groupId} -DartifactId=${app} -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
cd ${app}
rm -rf ./src
sed -i 's#<packaging>jar</packaging>#<packaging>pom</packaging>#g' pom.xml

# create sub project
mvn archetype:generate -DgroupId=${groupId} -DartifactId=${app}-common -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
mvn archetype:generate -DgroupId=${groupId} -DartifactId=${app}-domain -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
mvn archetype:generate -DgroupId=${groupId} -DartifactId=${app}-dao -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
mvn archetype:generate -DgroupId=${groupId} -DartifactId=${app}-service -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
mvn archetype:generate -DgroupId=${groupId} -DartifactId=${app}-web -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

xmlstarlet ed -d  '/*[local-name()="project"]/*[local-name()="groupId"]' -d '/*[local-name()="project"]/*[local-name()="version"]' -d '/*[local-name()="project"]/*[local-name()="packaging"]' -a '/*[local-name()="project"]/*[local-name()="artifactId"]' -t elem -n 'packaging' -v "jar"  ${app}-common/pom.xml > ${app}-common/pom.xml.new
mv ${app}-common/pom.xml.new ${app}-common/pom.xml

xmlstarlet ed -d  '/*[local-name()="project"]/*[local-name()="groupId"]' -d '/*[local-name()="project"]/*[local-name()="version"]' -d '/*[local-name()="project"]/*[local-name()="packaging"]' -a '/*[local-name()="project"]/*[local-name()="artifactId"]' -t elem -n 'packaging' -v "jar"  ${app}-domain/pom.xml > ${app}-domain/pom.xml.new
mv ${app}-domain/pom.xml.new ${app}-domain/pom.xml

xmlstarlet ed -d  '/*[local-name()="project"]/*[local-name()="groupId"]' -d '/*[local-name()="project"]/*[local-name()="version"]' -d '/*[local-name()="project"]/*[local-name()="packaging"]' -a '/*[local-name()="project"]/*[local-name()="artifactId"]' -t elem -n 'packaging' -v "jar"  ${app}-domain/pom.xml > ${app}-domain/pom.xml.new
mv ${app}-domain/pom.xml.new ${app}-domain/pom.xml

xmlstarlet ed -d  '/*[local-name()="project"]/*[local-name()="groupId"]' -d '/*[local-name()="project"]/*[local-name()="version"]' -d '/*[local-name()="project"]/*[local-name()="packaging"]' -a '/*[local-name()="project"]/*[local-name()="artifactId"]' -t elem -n 'packaging' -v "jar"  ${app}-dao/pom.xml > ${app}-dao/pom.xml.new
mv ${app}-dao/pom.xml.new ${app}-dao/pom.xml

xmlstarlet ed -d  '/*[local-name()="project"]/*[local-name()="groupId"]' -d '/*[local-name()="project"]/*[local-name()="version"]' -d '/*[local-name()="project"]/*[local-name()="packaging"]' -a '/*[local-name()="project"]/*[local-name()="artifactId"]' -t elem -n 'packaging' -v "jar"  ${app}-service/pom.xml > ${app}-service/pom.xml.new
mv ${app}-service/pom.xml.new ${app}-service/pom.xml

xmlstarlet ed -d  '/*[local-name()="project"]/*[local-name()="groupId"]' -d '/*[local-name()="project"]/*[local-name()="version"]' -d '/*[local-name()="project"]/*[local-name()="packaging"]' -a '/*[local-name()="project"]/*[local-name()="artifactId"]' -t elem -n 'packaging' -v "war"  ${app}-web/pom.xml > ${app}-web/pom.xml.new
mv ${app}-web/pom.xml.new ${app}-web/pom.xml

mkdir ${app}-web/src/main/java

# TODO
# add spring  in pom.xml
# add ${app}-web/src/main/resources/spring/spring-web.xml 
# modify ${app}-web/src/main/webapp/WEB-INF/web.xml
# add hello world code in ${app}-web/src/main/java/web/IndexController.java
# add tomcat plugin in ${app}-web/pom.xml
