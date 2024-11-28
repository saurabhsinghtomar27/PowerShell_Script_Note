# Append the Content in a Files
function AppendContent {
    
    param(
        [string] $Filename1,
        [String] $Filename2,
        [string] $Content
    )
    ## Adding Content in File
    Add-Content -Path "C:\Users\SaurabhSingh\Downloads\PowerShell\Test2\Test2\PowerShell Project\BasicFileOperation\$($Filename1)" -Value $Content
    Add-Content -Path "C:\Users\SaurabhSingh\Downloads\PowerShell\Test2\Test2\PowerShell Project\BasicFileOperation\$($Filename2)" -Value $Content

}

Write-Output "Write in a File."
#Taking Files To append
Write-Output "FileName: 1"
$Filename1=Read-Host
Write-Output "FileName: 2"
$Filename2=Read-Host

# Taking Content Of the File To Append
Write-Output "Content for a File"
$Content=Read-Host

# Function Call
AppendContent -Filename1 $Filename1 -Filename2 $Filename2 -Content $Content

# Showing the Content of The File
Write-Output "$($Filename1) Content Inside the File"
Get-Content -Path "C:\Users\SaurabhSingh\Downloads\PowerShell\Test2\Test2\PowerShell Project\BasicFileOperation\$($Filename1)"

Write-Output "$($Filename1) Content Inside the File"
Get-Content -Path "C:\Users\SaurabhSingh\Downloads\PowerShell\Test2\Test2\PowerShell Project\BasicFileOperation\$($Filename1)"

