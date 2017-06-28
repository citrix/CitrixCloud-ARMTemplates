Deploy a Citrix Cloud Connector to an existing Domain

This template is designed to provision Cloud Connector instances within an availability set.
Provide the necessary details from Citrix Cloud to link these instances to a specific Citrix Cloud Resource Location.

Required information from Citrix Cloud is: the Citrix Cloud customer ID, Citrix Cloud API key and secret, and an existing Citrix Cloud Resource Location.
The virtual network and subnet need to exist in the target Azure subscription.
Active Directory is required and must be defined as the DNS source for the virtual network.  Windows Server Active Directory or Azure AD Directory Services can be used to meet this requirement.

Be sure that you DO NOT select any resource group where you will be provisioning XenApp or XenDesktop worker / session machines.  Cloud Connectors are part of your infrastrucutre and should be in different Resource Group from your worker / session machines.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fbrianehlert%2FCitrixCloudQuickStart%2Fmaster%2FCloudConnector%2FCitrixCloudConnector.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png" alt="Azure Public"/>
</a>
<a href="https://portal.azure.us/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fbrianehlert%2FCitrixCloudQuickStart%2Fmaster%2FCloudConnector%2FCitrixCloudConnector.json" target="_blank">
    <img src="http://azuredeploy.net/AzureGov.png" alt="Azure Government"/>
</a>
<a href="https://portal.azure.cn/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fbrianehlert%2FCitrixCloudQuickStart%2Fmaster%2FCloudConnector%2FCitrixCloudConnector.json" target="_blank">
    <img src="http://azuredeploy.net/AzureCn.png" alt="Azure China"/>
</a>
<a href="https://portal.microsoftazure.de/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fbrianehlert%2FCitrixCloudQuickStart%2Fmaster%2FCloudConnector%2FCitrixCloudConnector.json" target="_blank">
    <img src="http://azuredeploy.net/AzureDe.png" alt="Azure Germany"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fbrianehlert%2FCitrixCloudQuickStart%2Fmaster%2FCloudConnector%2FCitrixCloudConnector.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>
