// ------------------------------------------------------------------------------------------------
// Deployment parameters
// ------------------------------------------------------------------------------------------------
@description('Az Resources tags')
param tags object = {}
@description('Az Resources deployment location')
param location string

// ------------------------------------------------------------------------------------------------
// FD Configuration parameters
// ------------------------------------------------------------------------------------------------
@description('Front Door Name')
@maxLength(64)
param fd_n string

// ------------------------------------------------------------------------------------------------
// Deploy FD
// ------------------------------------------------------------------------------------------------
resource frontdoor 'Microsoft.Network/frontDoors@2019-05-01' = {
  name: fd_n
  tags: tags
  location: location
}

output id string = frontdoor.id
