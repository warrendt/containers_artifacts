docker network create openhack

docker pull mcr.microsoft.com/mssql/server:2017-latest
docker run --network=openhack -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=<YourStrong@Passw0rd>" -p 1433:1433 --name sql1 -h sql1 -d mcr.microsoft.com/mssql/server:2017-latest

sudo docker exec -it sql1 "bash"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "<YourStrong@Passw0rd>"
CREATE DATABASE mydrivingDB
GO

//Create the DB 


cd /src/poi
docker build -f ../../Dockerfiles/Dockerfile_3 -t "tripinsights/poi:1.0" .

docker run --network openhack -e SQLFQDN=sql1 -e "SQLUSER=SA" -e SQLPASS="<YourStrong@Passw0rd>" -e SQLDB=mydrivingDB openhack/data-load:v1

docker run --network=openhack -d -p 8080:80 --name poi -e "SQL_USER=SA" -e "SQL_PASSWORD=<YourStrong@Passw0rd>" -e "SQL_SERVER=sql1" -e "ASPNETCORE_ENVIRONMENT=Local" tripinsights/poi:1.0

curl -i -X GET 'http://localhost:8080/api/poi' 
