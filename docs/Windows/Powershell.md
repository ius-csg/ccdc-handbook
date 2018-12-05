##Basics

Finding out more about any given command

'''Powershell
Get-help [Command]
'''

Great way to discover new commands
'''Powershell
Get-Command
Get-Command -Noun 
'''
Get-Command by itself will simply spew out all commands currently installed.The noun option allows you to look for commands that affect any given noun. For example, when the string "Service" is used powershell will show all commands that involve Services.

Often a command will give much more output than is desired. If searching for a specific property, such as name, the select command can be used to fileter out all the unnesissary information
'''Powershell
Get-Service | select Name
'''
The above command will first retrive the information about the services, but then will only display the selected attribute, the names.
###Discovering the System

####Enviroment Variables
Enviromental variables can be used to discover many system properties. All enviroment variables are in the form "$env:<identifer>" where <identifier> is the name of the specific variable. A couple of useful enviroment variables are listed below.
'''Powershell
$env:OS
$env:ComputerName
$env:Username
'''
There are many other enviroment variables. 

####Processes & Services
Another point of interest on the system is discovering process and services.This is simple to do in powershell. Get-EventLog requires the name of the log that is to be retrivied (Ex/ Application)
'''Powershell
Get-Process
Get-Service
Get-Eventlog
'''
Remember the use of "Get-Command -Noun " can be used to discover other commands that could interact with the Process or Service is those keywords are passed to the -Noun Option

####Users
Discovering the users is an important step in the administrative process. This includes both the names of users and, more importantly, the groups that those users are a part of.
'''Powershell
Get-WmiObject Win32_useraccount
Get-WmiObject Win32_group
Get-WmiObject Win32_groupuser
'''
These commands will display the user accounts, groups, and users contained in a specific group respectivly.

Administrative users are very important to keep track of so this script displays some account information of every administer on the local computer.
'''Powershell
Get-WmiObject win32_groupuser |
Where-Object { $_.groupcomponent -match 'administrators' } |
ForEach-Object {[wmi]$_.partcomponent}
'''

Once this information is discovered it may be desirable to discover more about the user accounts or change some attributes of the account. In order to do this a varible containing an User object can be created.
'''Powershell
[adsi]$userVar = "winNT://<ComputerName>/<username>"
'''
Where
-<ComputerName> is the name of the computer the account is on
-<UserName> is the name of the account

After creation the User Variable's properities can be examined or changed. 
'''Powershell
$userVar.lastlogin
$userVar.badpasswordattempts
$userVar.setpassword("CantPwnMe")
'''
Invoking these commands will display the property or change it as appropriate. There are many other properties, these are but a few interesting examples.
