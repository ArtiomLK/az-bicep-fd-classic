targetScope = 'resourceGroup'
// ------------------------------------------------------------------------------------------------
// Deployment parameters
// ------------------------------------------------------------------------------------------------
// Sample tags parameters
var tags = {
  project: 'bicephub'
  env: 'dev'
}

param location string = 'eastus'
// ------------------------------------------------------------------------------------------------
// REPLACE
// '../main.bicep' by the ref with your version, for example:
// 'br:bicephubdev.azurecr.io/bicep/modules/plan:v1'
// ------------------------------------------------------------------------------------------------

// ------------------------------------------------------------------------------------------------
// Front Door Deployment Examples
// ------------------------------------------------------------------------------------------------

module fda '../main.bicep' = {
  name: 'fda'
  params: {
    tags: tags
    location: location
    fd_n: 'fda-${guid(subscription().id, resourceGroup().id, tags.env)}'
  }
}
