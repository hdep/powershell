# powershell

This repo has two scripts :

- create_users.ps1 : create AD users from csv,
- add_unix_attributes.ps1 : add Linux attributes to users
- change_folder_permissions.ps1 : list all folder and then add full permission on the folder. Username is the name of the folder.

How to use create_users.ps1 :

powershell script to create AD users
To run this script you need administrator privileges and a csv file.
the csv file should looks like :
htest,Hugo,TEST,hugo.test@mail.fr,Hugo TEST
