This template creates a Virtual Network with three subnets.

This template should be used during the setup of an Azure subscription for Citrix Cloud, prior to beginning the process of creating Machine Catalogs.
Use this only if you don't already have a virtual network that you want to attach your VMs to.

If your AD already exists on another virtual network in the same subscrition - you can link the virtual networks with a peering.
If your AD already exists on another virtual network in a different subscription - you can link the virtual networks with a gateway.
(remember that peerings and gateways must be set up properly on both virtual networks)
If you do not already have an AD / AAD DS in Azure, please see this document: https://support.citrix.com/article/CTX224111

Do not forget to return to the deployed Virtual Network and update the DNS settings of this Virtual Network after you have completed your Active Directory / Azure Active Direcotry Domain Services setup.

infrastructure subnet for Cloud Connectors and other infrastructure machines.
session subnet for XenApp worker machines.
desktop subnet for XenDesktop worker machines.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fbrianehlert%2FCitrixCloudQuickStart%2Fmaster%2FVirtualNetwork%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png" alt="Azure Public"/>
</a>
<a href="https://portal.azure.us/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fbrianehlert%2FCitrixCloudQuickStart%2Fmaster%2FVirtualNetwork%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/AzureGov.png" alt="Azure Government"/>
</a>
<a href="https://portal.azure.cn/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fbrianehlert%2FCitrixCloudQuickStart%2Fmaster%2FVirtualNetwork%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/AzureCn.png" alt="Azure China"/>
</a>
<a href="https://portal.microsoftazure.de/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fbrianehlert%2FCitrixCloudQuickStart%2Fmaster%2FVirtualNetwork%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/AzureDe.png" alt="Azure Germany"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fbrianehlert%2FCitrixCloudQuickStart%2Fmaster%2FVirtualNetwork%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>
