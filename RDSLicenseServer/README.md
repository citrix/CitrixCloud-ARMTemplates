Deploy an RDS License Server to an existing Domain

This template is in prototype.  If it is useful to you, that is excellent.  If it does not meet your scenarios, help us make it better or submit an issue.

This template is designed to provision an RDS License Server.
Following creation of the RDS License Server you will need to logon as a domain user, activate the license server, and install licenses.
- https://docs.microsoft.com/en-us/windows-server/remote/remote-desktop-services/rds-activate-license-server
- https://docs.microsoft.com/en-us/windows-server/remote/remote-desktop-services/rds-install-cals

The virtual network and subnet need to exist in the target Azure subscription.
Active Directory is required and must be defined as the DNS source for the virtual network.  Windows Server Active Directory or Azure AD Directory Services can be used to meet this requirement.

Be sure that you DO NOT select any resource group where you will be provisioning XenApp or XenDesktop worker / session machines.  An RDS License Server is part of your infrastructure for XenApp and should be in different Resource Group from your worker / session machines.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcitrix%2FCitrixCloud-ARMTemplates%2Fmaster%2FRDSLicenseServer%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png" alt="Azure Public"/>
</a>
<a href="https://portal.azure.us/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcitrix%2FCitrixCloud-ARMTemplates%2Fmaster%2FRDSLicenseServer%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/AzureGov.png" alt="Azure Government"/>
</a>
<a href="https://portal.azure.cn/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcitrix%2FCitrixCloud-ARMTemplates%2Fmaster%2FRDSLicenseServer%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/AzureCn.png" alt="Azure China"/>
</a>
<a href="https://portal.microsoftazure.de/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcitrix%2FCitrixCloud-ARMTemplates%2Fmaster%2FRDSLicenseServer%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/AzureDe.png" alt="Azure Germany"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fcitrix%2FCitrixCloud-ARMTemplates%2Fmaster%2FRDSLicenseServer%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>
