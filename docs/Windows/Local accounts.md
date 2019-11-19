# Local Account Management
These commands apply only to local user accounts, and are unlikely to influence Windows AD domain accounts. 
All of the following commands are via command prompt

## Creating New Users

    net user /add [name] [password]
    
## Creating new groups

    net localgroup [Group Name] /add

## Adding a user to a group

    Net localgroup [Group Name] [User Name] /add
    
All of the above commands have a /delete option as well, however it is normally better to disable accounts rather than delete them. This can be accomplished with the following:

    net user [Username] /active{yes|no}

## Disabling default accounts

**Important step**
    
The built in Administrator and Guest accounts are often insecure, thus disabling them as follows would be desirable. This may be also done via AD group policy.

    net Administrator /active:no
    net Guest /active:no

However, it is important to replace the admin account with another admin of your own creation in order to prevent becoming locked out of the system. This can be accomplished by creating a user and adding them to the "Administrators" group as follows:

    Net user /add NewAdmin $eCuR3P@S$W0rd
    Net localgroup Administrators NewAdmin /add
    
This will add the user "NewAdmin" with password `$eCuR3P@S$W0rd` and then put them in the Administrators group.

## Changing default passwords

**Important step**

For a list of users use:

    net user

From that list of users one can manually reset a password using

    net user [username] [new password]


