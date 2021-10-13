# AKS_ID=$(az aks show \
#     --resource-group teamResources \
#     --name Team3AKS2 \
#     --query id -o tsv)


# WEB_ID=$(az ad group create --display-name web --mail-nickname web --query objectId -o tsv)
# echo $WEB_ID
# az role assignment create \
#   --assignee $WEB_ID \
#   --role "Azure Kubernetes Service Cluster User Role" \
#   --scope $AKS_ID

# API_ID=$(az ad group create --display-name api --mail-nickname api --query objectId -o tsv)
# echo $API_ID
# az role assignment create \
#   --assignee $API_ID \
#   --role "Azure Kubernetes Service Cluster User Role" \
#   --scope $AKS_ID

# UPN="35632050-800d-401a-ab0b-09fcf94ad448"
# az ad group member add --group web --member-id $UPN

# UPN="a60ebd5c-81f6-47bf-b7e7-909f1a73fa8e"
# az ad group member add --group api --member-id $UPN



RID=$(az ad group show --group web --query objectId -o tsv)
echo $RID
