Deploy a Citrix Cloud Connector to an existing Domain

This template is in prototype.  If it is useful to you, that is excellent.  If it does not meet your scenarios, help us make it better or submit an issue.

This template is designed to provision Cloud Connector instances within an availability set.
Provide the necessary details from Citrix Cloud to link these instances to a specific Citrix Cloud Resource Location.

Required information from Citrix Cloud is: the Citrix Cloud customer ID, Citrix Cloud API key and secret, and an existing Citrix Cloud Resource Location.
The virtual network and subnet need to exist in the target Azure subscription.
Active Directory is required and must be defined as the DNS source for the virtual network.  Windows Server Active Directory or Azure AD Directory Services can be used to meet this requirement.

Be sure that you DO NOT select any resource group where you will be provisioning XenApp or XenDesktop worker / session machines.  Cloud Connectors are part of your infrastrucutre and should be in different Resource Group from your worker / session machines.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcitrix%2FCitrixCloud-ARMTemplates%2Fmaster%2FCloudConnector%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png" alt="Azure Public"/>
</a>
<a href="https://portal.azure.us/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcitrix%2FCitrixCloud-ARMTemplates%2Fmaster%2FCloudConnector%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/AzureGov.png" alt="Azure Government"/>
</a>
<a href="https://portal.azure.cn/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcitrix%2FCitrixCloud-ARMTemplates%2Fmaster%2FCloudConnector%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/AzureCn.png" alt="Azure China"/>
</a>
<a href="https://portal.microsoftazure.de/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcitrix%2FCitrixCloud-ARMTemplates%2Fmaster%2FCloudConnector%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/AzureDe.png" alt="Azure Germany"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fcitrix%2FCitrixCloud-ARMTemplates%2Fmaster%2FCloudConnector%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

Before you begin, get the necessary information from Citrix Cloud:

Resource Location: the connection to your resources is defined as a Resource Location in Citrix Cloud. An existing Resource Location needs to be defined that this Connector will link to. 
For more details on resources locations, including what they provide and where they should be located see: http://docs.citrix.com/en-us/citrix-cloud/overview/about/what-are-resource-locations.html

Secure Client Connection: A secure client connection consists of a Client API Id and Client API Secret and is required to interact with Citrix Cloud APIs. 
It can be created on the API Access page under Identity and Access Management in Citrix Cloud.

Citrix Cloud Customer ID: This can be found on the page where you create the API ID and secret.