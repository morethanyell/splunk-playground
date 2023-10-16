# Get the current date and time in the specified format
$currentDateTime = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"

# Get the name of the machine
$machineName = $env:COMPUTERNAME

# Get all local groups
$localGroups = Get-LocalGroup | Select *

# Iterate through each local group and retrieve members
foreach ($group in $localGroups) {
    $members = Get-LocalGroupMember -Group $group.Name | Select *
    foreach ($member in $members) {
        Write-Host "$currentDateTime $machineName group_name='$($group.Name)' group_principal_source=$($group.PrincipalSource) group_sid=$($group.SID) group_description='$($group.Description)' member=$member"
    }
}