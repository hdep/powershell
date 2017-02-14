Remove-Variable -Name * -Force -ErrorAction SilentlyContinue
Import-Module ActiveDirectory
# first id to use
$id = 2025
# group id to use
$gid = 2003
$group = "it"
$usuarios = Get-ADGroupMember -identity $group -Recursive 

# for each users add uidNumber, gidNumber, homeDirectory and loginShell

foreach($usr in $usuarios){
  write-host $usr.SamAccountName,$usr.mssfu30nisdomain,$usr.uidnumber
  write-host $id
  write-host $gid
  $id++
  # home directory is string + SaMaccountName
  $home="/home/"+$usr.SamAccountName
  write-host $home
  set-aduser -Identity $usr.SamAccountName -Replace @{uidNumber=$id}
  set-aduser -Identity $usr.SamAccountName -Replace @{gidNumber=$gid}
  set-aduser -Identity $usr.SamAccountName -Replace @{homeDirectory=$home}
  set-aduser -Identity $usr.SamAccountName -Replace @{loginShell="/bin/bash"}
  }
