

ADMIN_ID=$(az ad group create --display-name aksadmin --mail-nickname aksadmin --query objectId -o tsv)

API_ID=$(az ad group create --display-name api --mail-nickname api --query objectId -o tsv)

WEB_ID=$(az ad group create --display-name web --mail-nickname web --query objectId -o tsv)

