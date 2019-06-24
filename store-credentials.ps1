
# Run this once
$password = "Plain text password to store"
$secureStringPwd = $password | ConvertTo-SecureString -AsPlainText -Force 
$secureStringText = $secureStringPwd | ConvertFrom-SecureString 
Set-Content "C:\temp\ExportedPassword.txt" $secureStringText  # Directory and text file you want to store the encrypted password.

# Creating a credential object from the encrypted text file
$username = "some-user@domain.com"
$pwdTxt = Get-Content "C:\temp\ExportedPassword.txt"  # Same directory you stored the encrypted password.
$securePwd = $pwdTxt | ConvertTo-SecureString 
$credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $securePwd

# Now you can pass $credentials to Connect-MSolService, SMTP, etc for authentication. 