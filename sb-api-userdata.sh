#! /bin/bash
sudo yum update -y
sudo yum -y install java
sudo wget https://github.com/GogHox/smart-bank-react/releases/download/done/smart-bank-api.jar -O /opt/smart-bank-api.jar
# sudo wget https://github.com/iamzeehwee/smartbank-modules-api/releases/download/api-jar-v0.1/smart-bank-api.jar -O /opt/smart-bank-api.jar
#sudo wget https://github.com/iamzeehwee/smartbank-modules-api/releases/download/api-jar-v0.2/smart-bank-api.jar -O /opt/smart-bank-api.jar
#sudo wget https://github.com/iamzeehwee/smartbank-modules-api/releases/download/api-jar-v0.3/smart-bank-api.jar -O /opt/smart-bank-api.jar
#sudo wget https://github.com/iamzeehwee/smartbank-api-last/releases/download/v0.1/smart-bank-api.jar -O /opt/smart-bank-api.jar
#sudo java -jar -Dserver.port=80 -Dspring.datasource.url=jdbc:postgresql://smartbank-db.cdfdu5whoyo5.us-west-1.rds.amazonaws.com/saturnpg /opt/smart-bank-api.jar &
#sudo java -jar -Dserver.port=80 -Dspring.datasource.url=jdbc:postgresql://smartbank-db.cdfdu5whoyo5.us-west-1.rds.amazonaws.com.local:5432/saturnpg /opt/smart-bank-api.jar &
#sudo java -jar -Dserver.port=80 -Dspring.datasource.url=jdbc:postgresql://dbserver.reksu12.svc.cluster.local:5432/saturnpg /opt/smart-bank-api.jar &
sudo java -jar -Dserver.port=80 /opt/smart-bank-api.jar &