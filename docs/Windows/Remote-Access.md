# Disabling Remote Access
Windows has 3 primary methods of obtaining a shell remotely, as of Server 2008. These include:
* RDP
* WinRM
* Telnet

All of these should be disabled at all times during the competition.

## Disabling RDP
`sc stop TermService`
## Disabling WinRM
`sc stop WinRM`
## Disabling Telnet
`sc stop tlntsvr`