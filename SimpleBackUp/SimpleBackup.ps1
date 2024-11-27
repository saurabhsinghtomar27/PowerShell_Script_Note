# BackUp Store
## File which Have to Backup Listed in this Txt File
$BackUpLocationsFilePath = "C:\Users\SaurabhSingh\Downloads\PowerShell\Test2\Test2\PowerShell Project\SimpleBackUp\Directories.txt"

$BackupLocations = Get-Content -Path $BackUpLocationsFilePath
## Where to Store that BackUp File
$StorageLocation = "C:\Users\SaurabhSingh\Downloads\PowerShell\Test2\Test2\PowerShell Project\SimpleBackUp\BackUpStorage"
## Folder Or Dir Name 
$BackupName = "Backup $(Get-Date -Format "yyyy-MM-dd hh-mm")";
ForEach ($Location in $BackupLocations) {
    
    Write-Output "Backing up $($Location)"
    $LeadingPath = "$($Location.Replace(':',''))";
    # Checking Whether the BackUp Folder is Exist Or Not
    if (-not (Test-Path "$StorageLocation\$BackupName\$LeadingPath")) {
        ## If BackUp Dir is not there Creating that BackUp Dir
        New-item -Path "$StorageLocation\$BackupName\$LeadingPath" -ItemType Directory
    }
    ## Copying All Items in that Backup Dir
    Get-ChildItem -path $Location | Copy-Item -Destination "$StorageLocation\$BackupName\$LeadingPath" -Recurse -Container
}

# Zipping Backup Folder Or Dir
Compress-Archive -Path "$StorageLocation\$BackupName" -DestinationPath "$StorageLocation\$BackupName.zip" -CompressionLevel Fastest

