ACR_NAME=registrymoa6722

az acr build --registry registrymoa6722 --image "tripinsights/poi:1.0" .

az login 

az acr build -f ../../dockerfiles/Dockerfile_3 --registry registrymoa6722 --image "tripinsights/poi:1.0" . - Jimmy
az acr build -f ../../dockerfiles/Dockerfile_0 --registry registrymoa6722 --image "tripinsights/user-java:1.0" . - Kamil
az acr build -f ../../dockerfiles/Dockerfile_1 --registry registrymoa6722 --image "tripinsights/tripviewer:1.0" . - Claudia 
az acr build -f ../../dockerfiles/Dockerfile_2 --registry registrymoa6722 --image "tripinsights/userprofile:1.0" . - Stef 
az acr build -f ../../dockerfiles/Dockerfile_4 --registry registrymoa6722 --image "tripinsights/trips:1.0" . - Ernst 

5239decf-2a5b-497d-9f85-b64f45c13a65

az account set --subscription 5239decf-2a5b-497d-9f85-b64f45c13a65