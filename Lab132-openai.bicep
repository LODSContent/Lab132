param accountName string = 'openAI-${uniqueString(resourceGroup().id)}'

param location string = resourceGroup().location

param sku string = 'S0'

resource openAI 'Microsoft.CognitiveServices/accounts@2021-10-01' = {
  name: accountName
  location: location
  sku: {
    name: sku
  }
  kind: 'OpenAI'
  properties: {}
}

resource openAI_gpt35Turbo 'Microsoft.CognitiveServices/accounts/deployments@2022-12-01' = {
  parent: openAI
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0301'
    }
    scaleSettings: {
      scaleType: 'Standard'
    }
  }
}

resource openAI_textDavinci003 'Microsoft.CognitiveServices/accounts/deployments@2022-12-01' = {
  parent: openAI
  name: 'text-davinci-003'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-davinci-003'
      version: '1'
    }
    scaleSettings: {
      scaleType: 'Standard'
    }
  }
}
