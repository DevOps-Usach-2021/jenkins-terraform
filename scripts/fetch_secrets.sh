az login --identity --allow-no-subscriptions --output none

echo "ARM_SUBSCRIPTION_ID=fc8171ee-10a5-4635-8fd1-0c45800663f1" >> terraform.properties
echo "ARM_TENANT_ID=fa587b31-1be9-4b24-b7d6-b163f0a2fcdf" >> terraform.properties
export ARM_CLIENT_ID=`az keyvault secret show --name sp-tf-id --vault-name diplomado-devops-akv | jq -r .value`
export ARM_CLIENT_SECRET=`az keyvault secret show --name sp-tf-password --vault-name diplomado-devops-akv | jq -r .value`

echo "client_id $ARM_CLIENT_ID"