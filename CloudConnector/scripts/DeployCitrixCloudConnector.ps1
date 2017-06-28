<#
    .SYNOPSIS
        Downloads and Installs the Citrix Cloud Connecter

    .PARAMETER CustomerId
        The customer ID to install the connector for

    .PARAMETER APIClientID:
        The customer's client API ID

    .PARAMETER APIClientSecret
        The customer's client API Secret

    .PARAMETER ResourceLocation
        The name of the Citrix Cloud resource location to use

    .PARAMETER TrustUri 
        The URI to the trust service

    .PARAMETER ConnectorDowloadPath
        The path to download the connector to

    .PARAMETER ConnectorInstallerName
        The name of the connector installation package
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [String] $CustomerId,

    [Parameter(Mandatory=$true)]
    [String] $APIClientID,

    [Parameter(Mandatory=$true)]
    [String] $APIClientSecret,

    [Parameter(Mandatory=$true)]
    [string] $ResourceLocation,

    [Parameter(Mandatory=$false)]
    [string] $TrustUri = "https://trust.citrixworkspacesapi.net",

    [Parameter(Mandatory=$false)]
    [string] $ConnectorDowloadPath = $pwd,

    [Parameter(Mandatory=$false)]
    [string] $ConnectorInstallerName = "cwcconnector.exe"
)

    function Download-Connector {
    [CmdletBinding()]
        param(
            [Parameter(Mandatory=$false)][string]$downloadPath = $pwd,
            [Parameter(Mandatory=$false)][string]$connecterName = "cwcconnector.exe",
            [Parameter(Mandatory=$false)][System.Uri]$downloadsBaseUri = "https://downloads.cloud.com",
            [Parameter(Mandatory=$true)][string]$customerId
        )

        $downloadsUri = New-Object -TypeName System.Uri -ArgumentList $downloadsBaseUri, "$customerId/connector/$connecterName"
        $downloadPath = (Join-Path -Path $downloadPath -ChildPath $connecterName)
        try {
            # Invoke-WebRequest -Uri $downloadsUri -OutFile $downloadPath
            $webClient = New-Object System.Net.WebClient
            $webClient.DownloadFile($downloadsUri, $downloadPath)
            Unblock-File $downloadPath 
        }
        catch {
            Throw "Unable to download connector $_"
        }
        if (Test-Path $downloadPath) {
            "Connector downloaded succesfully from $downloadsUri to $downloadPath"
        } else {
            Throw "Unable to download connector from $downloadsUri to $downloadPath"
        }
    }

    function Get-CustomerResourceLocations {
    [CmdletBinding()]
        param(
            [Parameter(Mandatory=$true)][string]$CustomerId,            
            [Parameter(Mandatory=$true)][string] $ClientId,
            [Parameter(Mandatory=$true)][string] $ClientSecret,
            [Parameter(Mandatory=$true)][string] $TrustUri,
            [Parameter(Mandatory=$false)][System.Uri] $registryServiceBaseUri = "https://registry.citrixworkspacesapi.net",
            [Parameter(Mandatory=$false)][switch]$ReturnPSObject
        )
        $ErrorActionPreference = "Stop"

        #GET Auth Header
        $registryServiceUri = New-Object -TypeName System.Uri -ArgumentList $registryServiceBaseUri, "$CustomerId/resourcelocations"
        $AuthHeader = New-BearerAuthHeaderFromSecureClient -ClientId $ClientId -ClientSecret $ClientSecret -TrustUri $TrustUri
        write-verbose $AuthHeader.Authorization

        #Get Customer resource location
        $getResponse = $null
        try {
            $getResponse = Invoke-RestMethod -Method GET -Uri $registryServiceUri -Headers $AuthHeader -ContentType "application/json" -Verbose
        }
        catch {
            $_.Exception.Response
        }

        if (-not $getResponse) {
            Write-Verbose "No response from endpoint $registryServiceUri" -Verbose
        }

        if ($ReturnPSObject) {
            return $getResponse
        } else {
            Write-Output (ConvertTo-Json $getResponse)
        }
    }

    function New-BearerAuthHeaderFromSecureClient {
        <#
            .SYNOPSIS
                Creates a bearer authorization header using a customer's secure client (ID & secret)

            .DESCRIPTION
                This command calls New-BearerAuthHeaderValue function to create a new bearer token.
                Then return the authorization header CWSAuth bearer=<bearer>.

            .PARAMETER  ClientId
                A client id for the customer

            .PARAMETER  ClientSecret
                A corresponding client secret of the client id specified.

            .PARAMETER  TrustUri
                The trust url.

        #>
        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$true)]
            [string] $ClientId,

            [Parameter(Mandatory=$true)]
            [string] $ClientSecret,

            [Parameter(Mandatory=$true)]
            [string] $TrustUri
        )
        $BearerAuthHeaderValue  = New-BearerAuthHeaderValue -ClientId $ClientId -ClientSecret $ClientSecret -TrustUri $TrustUri
        return @{"Authorization" = $BearerAuthHeaderValue}
    }

    function New-BearerAuthHeaderValue {
        <#
            .SYNOPSIS
                Create a new bearer token using a Customer's Secure Client 

            .DESCRIPTION
                This command contacts trust URI to obtain a bearer token.

            .PARAMETER  ClientId
                A client id for the customer

            .PARAMETER  ClientSecret
                A corresponding client secret of the client id specified.

            .PARAMETER  TrustUri
                The trust url.

            .PARAMETER Timeout
                The Invoke-RestMethod timeout used when contacting the trust url.
        #>

        [CmdletBinding()]
        param(
            [Parameter(Mandatory=$true)]
            [string] $ClientId,

            [Parameter(Mandatory=$true)]
            [string] $ClientSecret,

            [Parameter(Mandatory=$true)]
            [string] $TrustUri,

            [Parameter(Mandatory=$false)]
            [Int] $Timeout = 300
        )

        $endPoint = "root/tokens/clients"
        $trustUri = "$TrustUri/$endPoint"

        $Body = @{
            clientId = $ClientId
            clientSecret = $ClientSecret
        }
        write-verbose "[Body]: $(ConvertTo-Json $Body)"

        try {
            $response = Invoke-RestMethod -Uri $trustUri -Method "Post" -Body (ConvertTo-Json $Body) -ContentType application/json -TimeoutSec $Timeout -Verbose
        } catch [System.Net.WebException] {
            Write-Verbose "Trust endpoint failed: $_"
            throw $_
        }
        Write-Verbose "[Response] $(ConvertTo-Json $response)"

        $BearerAuthHeaderValue = "CWSAuth bearer=`"$($response.token)`""

        return $BearerAuthHeaderValue
    }

#Download Connector
Download-Connector -downloadPath $ConnectorDowloadPath -connecterName $ConnectorInstallerName -customerId $CustomerId

#Get Resource location id
$customerResourceLocations = Get-CustomerResourceLocations -CustomerId $CustomerId -ClientId $APIClientID -ClientSecret $APIClientSecret -TrustUri $TrustUri -ReturnPSObject -verbose
$SpecifiedResourceLocation = $customerResourceLocations.items | where {$_.name -eq $ResourceLocation}
if ($SpecifiedResourceLocation) {
    "Customer ResourceLocations $($SpecifiedResourceLocation.id)"
} else {
    Throw "Unable to find a resource location named $ResourceLocation"
}

#Install Connector
$args = "/q /CustomerName:$CustomerId /ClientId:$APIClientID /ClientSecret:$APIClientSecret /Location:$($SpecifiedResourceLocation.id) /AcceptTermsOfService:true"
$ConnectorInstaller = (join-path -Path $ConnectorDowloadPath -ChildPath $ConnectorInstallerName)
"** Installing... $ConnectorInstaller with arguments $args ."
Start-Process $ConnectorInstaller $args -Wait