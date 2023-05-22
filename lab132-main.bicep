targetScope = 'subscription'

param location string = 'East US'
param resourceName string = 'resourceGroupLab132'

resource newRg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceName
  location: location
}

module openAI 'openai.bicep' = {
  name: 'openAIresource'
  scope: newRg
  params: {
    location: location
  }
}
