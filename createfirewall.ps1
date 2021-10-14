$RG="teamResources"
$FWPUBLICIP_NAME="team3FirewallIP"
$FWNAME="Team3AzureFirewall"
$LOC="northeurope"
$FWIPCONFIG_NAME="FirewallIPConfig"
$VNET_NAME="vnet"
$SUBID="5239decf-2a5b-497d-9f85-b64f45c13a65"
$PREFIX="Team3"
$FWROUTE_TABLE_NAME="${PREFIX}-fwrt"
$FWROUTE_NAME="${PREFIX}-fwrn"
$FWROUTE_NAME_INTERNET="${PREFIX}-fwinternet"

#Create and configure firewall
az network public-ip create -g $RG -n $FWPUBLICIP_NAME -l $LOC --sku "Standard"
az extension add --name azure-firewall
az network firewall create -g $RG -n $FWNAME -l $LOC --enable-dns-proxy true
az network firewall ip-config create -g $RG -f $FWNAME -n $FWIPCONFIG_NAME --public-ip-address $FWPUBLICIP_NAME --vnet-name $VNET_NAME

# Get IPs
$FWPUBLIC_IP=$(az network public-ip show -g $RG -n $FWPUBLICIP_NAME --query "ipAddress" -o tsv)
$FWPRIVATE_IP=$(az network firewall show -g $RG -n $FWNAME --query "ipConfigurations[0].privateIpAddress" -o tsv)

# Create UDR and add a route for Azure Firewall
az network route-table create -g $RG -l $LOC --name $FWROUTE_TABLE_NAME
az network route-table route create -g $RG --name $FWROUTE_NAME --route-table-name $FWROUTE_TABLE_NAME --address-prefix 0.0.0.0/0 --next-hop-type VirtualAppliance --next-hop-ip-address $FWPRIVATE_IP --subscription $SUBID
az network route-table route create -g $RG --name $FWROUTE_NAME_INTERNET --route-table-name $FWROUTE_TABLE_NAME --address-prefix $FWPUBLIC_IP/32 --next-hop-type Internet