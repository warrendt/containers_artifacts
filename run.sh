# # sudo docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=<YourStrong@Passw0rd>" \
# #    -p 1433:1433 --name sql1 -h sql1 \
# #    -d \
# #    mcr.microsoft.com/mssql/server:2017-latest

# # docker run -e SQLFQDN=sql1 -e SQLUSER=<db-user> -e SQLPASS=<password> -e SQLDB=mydrivingDB 


# # sudo docker exec -it sql1 "bash"
# # /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "<YourStrong@Passw0rd>"

# # docker run --network=container:sql1 -e SQLFQDN=sql1 -e SQLUSER=SA -e "SQLPASS=<YourStrong@Passw0rd>" -e SQLDB=mydrivingDB openhack/data-load:v1

# #  docker run -d --name redis example/redis --bind 127.0.0.1
# # $ # use the redis container's network stack to access localhost
# # $ docker run --rm -it --network container:redis example/redis-cli -h 127.0.0.1

# # NETWORK ID     NAME               DRIVER    SCOPE
# # 188143fcce37   azdevops_default   bridge    local
# # 01b9daf11f61   bridge             bridge    local
# # 724495b2a162   host               host      local
# # d094ec4c6793   none               null      local

# export SQL_SERVER="sql1"
# export SQL_USER="SA"
# export SQL_PASSWORD="<YourStrong@Passw0rd>"
# # docker run -d -p 8080:80 --name poi -e "SQL_PASSWORD=$SQL_PASSWORD" -e "SQL_SERVER=$SQL_SERVER" -e "SQL_USER=SA" -e "ASPNETCORE_ENVIRONMENT=L" tripinsights/poi:1.0

# docker run -d -p 8080:80 --name poi -e "SQL_USER=SA" -e "SQL_PASSWORD=<YourStrong@Passw0rd>" -e "SQL_SERVER=sql1" -e "ASPNETCORE_ENVIRONMENT=Local" tripinsights/poi:1.0