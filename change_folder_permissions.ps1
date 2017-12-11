$fileDirectory="//serveur.domain.local/homedir$/";
foreach($file in Get-ChildItem $fileDirectory)
{
    # Processing code goes here
   echo $file.name
   
   $acl = Get-Acl $file
   $permission = "DOMAIN\$file","FullControl","ContainerInherit,ObjectInherit”,"none","Allow"
   $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule $permission
   $acl.SetAccessRule($accessRule)
   $acl | Set-Acl $file.name
   echo "fin boucle"

}
