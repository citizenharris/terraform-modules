param(
  [string]$SqlServerName,
  [string]$AdminUserName,
  [string]$AdminPassword,
  [string]$LoginName,
  [string]$LoginPassword
)

if (Get-Module -ListAvailable -Name SqlServer) {
  Write-Host("No problems here")
}
else {
  Install-Module -Name SqlServer -Force
}

$query = "if not exists (SELECT name FROM master.sys.sql_logins where name = '${LoginName}') 
BEGIN 
  CREATE LOGIN [${LoginName}] WITH PASSWORD=N'${LoginPassword}' 
END
ELSE
BEGIN
  ALTER LOGIN [${LoginName}] WITH PASSWORD=N'${LoginPassword}' 
END"

Invoke-Sqlcmd -Query $query -ServerInstance $SqlServerName -username $AdminUserName -password $AdminPassword
