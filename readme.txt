To execute github workflow you need to set up secrets in the GitHub repository to ensure the authentication is secure. 
Navigate to your GitHub repo, go to Settings -> Secrets -> New repository secret:

AZURE_SERVICE_PRINCIPAL: The Service Principal ID
AZURE_SERVICE_PRINCIPAL_SECRET: The Service Principal Secret
AZURE_TENANT_ID: Your Azure Tenant ID
ACR_NAME: The name of the ACR (in this case, reference)

And update the variables in variables.auto.tfvars the next parameters to the correct repositories:

acr_server = "instance.azurecr.io"
source_acr_server        = "reference.azurecr.io"
chart_repository = "https://reference.azurecr.io/helm/ping"

Also update forbiddenNodeGroups in values.yaml inside ping helm chart with the node labels of the node groups to isolate.
  - forbidden1
  - forbidden2