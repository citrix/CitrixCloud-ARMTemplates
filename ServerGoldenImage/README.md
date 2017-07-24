Deploy a Citrix Cloud Golden Image to an existing Domain

This template is in prototype.  If it is useful to you, that is excellent.  If it does not meet your scenarios, help us make it better or submit an issue.

This template is designed to provision a Golden (aka Master) Windows Server image.
You still have to download and install the VDA (Virtual Delivery Agent) but this should get you started in few minutes.

The virtual network and subnet need to exist in the target Azure subscription.
Active Directory is required and must be defined as the DNS source for the virtual network.  Windows Server Active Directory or Azure AD Directory Services can be used to meet this requirement.

This defaults to using the Hybrid Use Benefit licensing.  Be sure to have the proper agreements in place to support that. It is your responsibility.

Be sure that you DO NOT select any resource group where you will be provisioning XenApp or XenDesktop worker / session machines.  You Golden / Master images are special and should be in different Resource Groups from your worker / session machines.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fbrianehlert%2FCitrixCloudQuickStart%2Fmaster%2FServerGoldenImage%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png" alt="Azure Public"/>
</a>
<a href="https://portal.azure.us/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fbrianehlert%2FCitrixCloudQuickStart%2Fmaster%2FServerGoldenImage%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/AzureGov.png" alt="Azure Government"/>
</a>
<a href="https://portal.azure.cn/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fbrianehlert%2FCitrixCloudQuickStart%2Fmaster%2FServerGoldenImage%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/AzureCn.png" alt="Azure China"/>
</a>
<a href="https://portal.microsoftazure.de/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fbrianehlert%2FCitrixCloudQuickStart%2Fmaster%2FServerGoldenImage%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/AzureDe.png" alt="Azure Germany"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fbrianehlert%2FCitrixCloudQuickStart%2Fmaster%2FServerGoldenImage%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>
