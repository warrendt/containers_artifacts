ACR_NAME=registrymoa6722

az acr build --registry registrymoa6722 --image "tripinsights/poi:1.0" .


az acr build -f ../../dockerfiles/Dockerfile_3 --registry registrymoa6722 --image "tripinsights/poi:1.0" .
az acr build -f ../../dockerfiles/Dockerfile_0 --registry registrymoa6722 --image "tripinsights/user-java:1.0" .
az acr build -f ../../dockerfiles/Dockerfile_1 --registry registrymoa6722 --image "tripinsights/tripviewer:1.0" .
az acr build -f ../../dockerfiles/Dockerfile_2 --registry registrymoa6722 --image "tripinsights/userprofile:1.0" .
az acr build -f ../../dockerfiles/Dockerfile_4 --registry registrymoa6722 --image "tripinsights/trips:1.0" .