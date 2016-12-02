Import-Csv  -Header SAM,Firstname,Lastname,Email,Displayname -Path "C:\test.csv" |  ForEach-Object  
{
    $_.SAM
    $upn =      $_.SAM + "@domain.local"

    New-ADUser -SamAccountName $_.SAM -DisplayName $_.Displayname -Name $_.Displayname -GivenName $_.Firstname -Surname $_.Lastname  -UserPrincipalName $upn  -EmailAddress $_.Email -AccountPassword (ConvertTo-SecureString -AsPlainText "Passw0rd" -Force) -Path "OU=Users, DC=domain, DC=local" -Enabled $true
    # ensure user is in group1 and group2
    Add-ADGroupMember group1 $_.SAM
    Add-ADGroupMember group2 $_.SAM
        
}
