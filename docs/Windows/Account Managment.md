##Account Managment

All of the following commands are via command prompt

####Creating New Users

    Net user /add [name] [password]
    
####Creating new groups

    Net localgroup [Group Name] /add

####Adding a user to a group

    Net localgroup [Group Name] [User Name] /add
    
All of the above commands have a /delete option as well, however it is normally better to disable accounts rather than delete them. This can be accomplished with the following:

    Net user [Username] /active{yes|no}
    
The built in Administrator and Guest accounts are often insecure, thus disabling them as follows would be desirable.

    Net Administrator /active:no
    Net Guest /active:no

However, it is important to replace the admin acount with another admin of your own creation in order to prevent becoming locked out of the system. This can be accomplished by creating a user and adding them to the "Administrators" group as follows:

    Net user /add NewAdmin $eCuR3P@S$W0rd
    Net localgroup Administrators NewAdmin /add
    
This will add the user "NewAdmin" with password "$eCuR3P@S$W0rd" and then put them in the Administrators group.
