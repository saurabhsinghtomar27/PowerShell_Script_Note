function system_details{
    # (Get-ComputerInfo).CsName
    # (Get-ComputerInfo).OsName
    # (Get-ComputerInfo).CsUserName
    ## Alternate and Less Time Consuming 
    $System_Info=Get-ComputerInfo
    $System_Info.CsName | Out-File -Path ./SystemNetworkLog.txt -Append
    $System_Info.OsName  | Out-File -Path ./SystemNetworkLog.txt -Append
    $System_Info.CsUserName  | Out-File -Path ./SystemNetworkLog.txt -Append
}

function Network_Detail{
    (Get-NetIPAddress).IPAddress  | Out-File -Path ./SystemNetworkLog.txt -Append
    Get-NetAdapter  | Out-File -Path ./SystemNetworkLog.txt -Append
    
}

system_details
Network_Detail