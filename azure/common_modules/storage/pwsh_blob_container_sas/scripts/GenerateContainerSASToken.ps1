param(
    [string]$StorageAccountName,
    [string]$ContainerName,
    [string]$Start,
    [string]$Expiry,
    [string]$Permissions
)

if (Get-Module -ListAvailable -Name Az.Storage) { }
else
{
    Install-Module -Name Az.Storage -Force
}

$ctx = New-AzStorageContext -StorageAccountName $StorageAccountName -UseConnectedAccount
$startDate = [datetime]::parseexact($Start, 'yyyy-MM-dd', $null)
$expiryDate = [datetime]::parseexact($Expiry, 'yyyy-MM-dd', $null)

New-AzStorageContainerSASToken -Name $ContainerName -Permission $Permissions -StartTime $startDate -ExpiryTime $expiryDate -context $ctx
