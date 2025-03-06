# PowerShell Script
PowerShell Version -> 
```Powershell
$PSVersionTable
```

## PowerShell cmdlets
cmdlets-> pronounced ("command-lets") are lightweight, built-in commands that perform specific functions. 

## Commands For cmdlets

### New-item
Syntax for the Command help ->
```Powershell
 get-help new-item
 ```

#### Creating a new File
```Powershell
New-item -path . -name "testing.txt" -itemtype "file" -Value "this is for testing purpose" 
```


#### Creating a new Folder
```powershell
 New-item -path . -name "test" -itemtype "directory"
 ```

#### Creating file inside a folder
```Powershell
New-item -path ./test -itemtype "file" -Value "this is for the testing 2 purpose"
```

### Copy-item
#### Copy Item 
```PowerShell
 Copy-Item -Path ./testing.txt1 -Destination ./test
```
#### Copy All Folder Items 
```PowerShell
copy-item -path ./test/* -destination .
 ```

### Rename-item
#### 
```powershell
rename-item -path ./saurabh.txt -NewName "anmol.txt"
```

### Remove_Item

#### To remove All item inside a folder 
```Powershell
 remove-item -path ./test/*
 ```

#### To remove all items except Excluding a in item
```powershell 
Remove-item -path "C:\Users\SaurabhSingh\Downloads\PowerShell\test\*"  -Include *.txt -Exclude *a*
```

### Move -item
```PowerShell
Move-item -path ./Demo.ps1 -Destination ./Test2
```


### Get-item

#### Get pwd
```PowerShell
 Get-item .
 ```

#### Get All Files and Folder 
```PowerShell
 Get-item *
```
#### Get Last Access Time for dir or File 
```PowerShell
(Get-item -path . ).LastAccessTime
```

#### Get Creation Time 
```Powershell 
(Get-item -path . ).CreationTime
```

### Get-Member
It will tell the Function

#### It will tell the String function 
``` PowerShell
"Hello" | Get-Member
```
```PowerShell
"hello".length O/P -> 5
 ```
 ### Set-Content

 #### Writing in a file with Creating a file 
 ```PowerShell
 Set-Content -Path ./anmol.txt -Value "hello set Content"
 ```
 
 #### It will write in all txt file as Empty 
 ```PowerShell
  Set-Content -Path "C:\Users\SaurabhSingh\Downloads\PowerShell\*" -Filter *.txt -Value "Empty"
  ```

 ### Get-Content

 #### Read the Content of File 
 ```PowerShell
   Get-Content -Path ./anmol.txt
   ```

#### Read the Content of the File till 3 line 
```PowerShell
 Get-Content -Path ./anmol.txt -TotalCount 3
 ```
 #### Read the Last Line of the File 
 ```PowerShell
  Get-Content -Path ./anmol.txt -Tail 1
  ```

 ### Add-Content
 #### Adding Content in a File 
 ```PowerShell
  Add-Content -Path ./anmol.txt -Value "Line 7"
  ```
 #### Copying One Content of file to Another 
 ```PowerShell
  $Test = Get-Content -Path ./anmol.txt
  Add-Content -Path ./saurabh.txt -Value $Test
  ```

### Clear-Content
### To Clear the Content 
```PowerShell
 clear-content -Path ./saurabh.txt
 ```

### Test-Path
#### To Check whether File or dir is Present or not 
```PowerShell
 test-path -Path "C:\Users\SaurabhSingh\Downloads\PowerShell"
 ```

### Get-Date
#### To Display Only Time 
```PowerShell
 Get-Date -DisplayHint Time
 ```

#### To Display Only Date 
```PowerShell
 Get-Date -DisplayHint Date
 ```

### Write-Host
```Powershell
write-host "Saurabh" -ForeGroundColor Red -BackgroundColor Green
```

### ForEach-Object
```PowerShell
10, 20, 30, 40 | ForEach-Object -Process {$_/10}

1
2
3
4

"Java.C++.C.Python.NodeJs" | ForEach-Object -MemberName Split -ArgumentList "."
O/p->
 Java
C++
C
Python
NodeJs 
```

### Pipeline (|)
#### Open app Notepad process will return 
```PowerShell
Get-Process notepad
```

#### It will the Get Process the and also ommit that process -
```Powershell
Get-Process notepad | Stop-Process
```

### Sort-Object
```PowerShell
10,20,30,40,50 | Sort-Object
```
```PowerShell
10,20,30,40,50 | Sort-Object -Descending -Unique
```

#### Sorting Inside a File 
```PowerShell 
Get-Content -path ./anmol.txt | Sort-Object -Descending
```

### Where-Object
#### It will only Show Stopped Service 
```PowerShell
 Get-Service | Where-Object {$_.Status -eq "Stopped"}
 ```
### Measure-Object
#### It is used to do Calculation-:

#### It will Count the Characters in a file 
```PowerShell
 Get-Content -path ./anmol.txt | Measure-Object -Character
 ```

#### It will Count the Line and Words in a file 
```PowerShell
 Get-Content -path ./anmol.txt | Measure-Object -Line -Word
```
```PowerShell
"Dog `ncat `nTiger " | Measure-Object -line -Word.  (`n) generate a new line
```
### Group-Object
#### Grouping same Extension 
```PowerShell
 Get-Item -path ./* | Group-Object -Property extension
 ```
#### Sorting and Grouping 
```PowerShell
Get-Item -path ./* | Group-Object -Property extension -NoElement | Sort-Object -Property Count
```

#### Grouping by Even and Odd 
```PowerShell
Group-Object -Property {$_ % 2}

Count Name                      Group
----- ----                      -----
   10 0 ->                     {2, 4, 6, 8…}
   </br>
   10 1 ->                      {1, 3, 5, 7…}
   ```

### Read-Host

#### User Input 
```PowerShell
 $var=Read-host -prompt "please enter your passord" 
 ```
#### It will take userInput as a Password Secure 
```PowerShell
 $var=Read-host -prompt "please enter your passord" -AsSecureString
 ```

### Tee-Object
#### It will Make new file and save all the Process in a file Process txt file 
```PowerShell
 Get-Process | Tee-Object -FilePath "C:\Users\SaurabhSingh\Downloads\PowerShell\process.txt
 ```
#### Saving Process in Variable 
```PowerShell
 Get-Process | Tee-Object -Variable Test
 ```

### Format-List
#### Process in the Form of the List 
```PowerShell
 Get-Process | Format-List
 ```

#### Only List of Parameter will that we have given 
```PowerShell
 Get-Process | Format-List -property Id, Name, CPU
 ```

### Get-ChildItem
#### Give all the Files and Folder inside that Directory 
```PowerShell
 Get-ChildItem -path .
 ```

#### Give the Inside Folder Files 
```PowerShell
Get-ChildItem -Path . -Recurse -Force

Example -:

PS C:\Users\SaurabhSingh\Downloads\PowerShell> Get-ChildItem -Path . -Recurse -Force </br>

    Directory: C:\Users\SaurabhSingh\Downloads\PowerShell 
     
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----          17-11-2024    17:44                test </br>
d----          17-11-2024    18:55                Test2 </br>
-a---          18-11-2024    12:10             48 anmol.txt </br>
-a---          19-11-2024    12:29          17839 process.txt </br>
-a---          19-11-2024    14:32           5020 Readme.md</br>
-a---          18-11-2024    12:17              0 saurabh.txt</br>

    Directory: C:\Users\SaurabhSingh\Downloads\PowerShell\test

Mode                 LastWriteTime         Length Name </br>
----                 -------------         ------ ----
-a---          17-11-2024    17:14              0 anmol.txt </br>
-a---          17-11-2024    17:32              0 tomar.txt </br>

    Directory: C:\Users\SaurabhSingh\Downloads\PowerShell\Test2

Mode                 LastWriteTime         Length Name </br>
----                 -------------         ------ ---- 
-a---          15-11-2024    15:41            606 Demo.ps1 </br>
```
-------------------------------------------------------------------------------------------------------------------------------------------

## Operator

#### Arithemetic Operators
  #### -> Add (+)
  #### -> Substract (-) 
  #### -> Multiplication (*) 
  #### -> Division (/) 
  #### ->Modulus (%) 

## Assignment Operators
 #### -> = (Assignment Operator)</br>
 #### -> += (Addition Assignment operator)</br>
 #### -> -= (Substraction Assignment Operator)</br>
 #### -> *= (Multiplication Assignment Operator)</br>
 #### -> /= (Division Assignment Operator)</br>
 #### -> %= (Modulus Assignment Operator)</br>
 #### -> ++ (Increment Operator)</br>
 #### -> -- (Decrement Operator)</br>
## Comparison Operators
 ### Equality Operator (eq,ne,gt,ge,lt,le) ( example -eq)
 ### Matching Operator (like,not like, match, not match)
 ```PowerShell
    Example -> "powershell" -like  "powershell"
  
     "powershell" -like  "*shell"    True
    
     "powershell" -notlike  "*sryrl" True
  ```
 ### Containment Operators (Contains, notContains, not in) 
 ```PowerShell
  Example -> 
   "apple","banana" -Contains "apple" True </br>
   "apple","banana" -notContains "apple" false
   ```
 ### Replacement Opertor 
 ```PowerShell
  Example -:
 
   "saurabh singh pandey" -replace "pandey", "Tomar" O/p -> saurabh singh Tomar
  ```
 ### Type Comparison Operator (is, isnot) 
 ```PowerShell
 Example -:
  $a -is [int] True 
  $a -isnot [int] False
  ```
### Logical Operators
  #### -> AND (Logical AND) </br>
  ```PowerShell
  Example -:
  ($a -lt $b) -and ($a -eq 10) O/p - True
  ```
  #### -> OR (Logical OR) 
  #### -> NOt (Logical NOT) 
  #### -> XOR (Logical XOR) 
  #### -> ! (same as Logical NOT) 
### Redirection Operators
 #### -> (>)  It will Put the process of Notepad in alpha txt file
 ```PowerShell 
 Get-Process -Name Notepad > "C:\Users\SaurabhSingh\Downloads\PowerShell\alpha.txt" 
 ```
 #### >> Append the text in file 
 ```PowerShell
  Get-Process -Name WINWORD >> "C:\Users\SaurabhSingh\Downloads\PowerShell\alpha.txt"
  ```
  #### ( 2>&1 ) 
  ```PowerShell
   Get-ChildItem -path "C:\Users\SaurabhSingh\Downloads\PowerShell" , "C:\Users\SaurabhSingh\Downloads\PowerShell\dafsf" 2>&1 > C:\Users\SaurabhSingh\Downloads\PowerShell\sigma.txt (it will store the output in the sigma.txt file. )
   ```
## Split and Join Operators
#### Join Operator
  Example -> 
  ```PowerShell
 $a="anmol", "saurabh", "tomar"  
PS C:\Users\SaurabhSingh\Downloads\PowerShell> -join $a 
anmolsaurabhtomar 
```
```PowerShell
$a="A,B,C,D,E
PS C:\Users\SaurabhSingh\Downloads\PowerShell> $a -split "," 
```

## Condition 
### IF Statement 
Example -:

 ```powershell
  if(test_expression)
  { 
    Statement ...
  } 
  ```
IF -ELSE Statement </br>
Else-if Statement </br>
Example -:
```PowerShell
$a=1
$b=11
if($a -eq $b){
    echo "both are equal"
}
elseif ($a -lt $b){
    echo "b is greater than a"
}
else {
    ëcho "a is greater than b"
}
```
```Powershell
$a=10
$b=11
if($a -eq $b){
    echo "both are equal"
}
elseif ($a -lt $b){
    echo "b is greater than a"
}
else {
    echo "a is greater than b"
}
 ```
### Switch Statment 

```PowerShell
switch (1) {
   1{"one"}
   2{"Two"}
   3{"Three"}
   4{"Four"}
   5{"Five"}
   1{"one1"}
   O/p ->
    One
    One1
}
```
```PowerShell
switch (1) {
   1{"one"; break}
   2{"Two"}
   3{"Three"}
   4{"Four"}
   5{"Five"}
   1{"one1"}
   O/p -: 
   One
}
```PowerShell
switch (1,2) {
   1{"one"}
   2{"Two"}
   3{"Three"}
   4{"Four"}
   5{"Five"}
}
O/p -> 
One
Two
```
## Loop
#### -> For Loop
```PowerShell
for($i=0 ;$i -lt 10; $i++){
    $i
}
```
```PowerShell
$a="A","B","C","D","E"
for($i=0 ;$i -lt $a.Length; $i++){
    $a[$i]
}
```
#### -> FOREACH LOOP
Example ->
```powershell
$a=1..6
foreach($i in $a)
{
    echo $i
}
```  
```PowerShell
$a= "a","b","c","d","e"
foreach($i in $a){
    $i
}
```
#### -> While LOOP
```PowerShell
$a=1
while($a -lt 10){
    $a
    $a++
}
```
#### -> Do While Loop
Example ->
```PowerShell
do {
    echo $a
    $a=$a+1
} while ( $a -lt 10)
```
#### Continue
```PowerShell
$a = 1
while ($a -lt 10) {
    $a
    $a++
   if ($a -eq 5) {
        continue;
    }
}
 ```
#### Break
```PowerShell
$a = 1
while ($a -lt 10) {
    $a
    $a++
   if ($a -eq 5) {
    break;
    }
}
```
## String

### Concatenation
```PowerShell
   "saurabh"+" Singh"
saurabh Singh
```
```PowerSell
$a="Micro"
$b="Soft"
$c= -join($a,$b)
echo $c
```
```PowerShell
$a="Micro"
$b="Soft"
$c= [System.String]::Concat($a,$b)
echo $c
```
### Substring()

```PowerShell
 $a="Windows PowerShell"
echo $a.Substring(0,7)
O/p -> Windows
```
### String Formatting
```PowerShell
$a="hello"     
$b="world"
$c="{0}{1}" -f $a,$b
$c
O/p-:
helloworld
```
### Replace
```PowerShell
$a="hello"
$a.replace('l','s')
O/P -: hesso
```
## Function
### Simple Function
```PowerShell
function currentDate{
    Get-Date
}
currentDate
O/p -> 20 November 2024 17:29:26
```
```PowerShell
function FunctionName($str) {
    
    Write-Host "hi there...$str"
    
}
$name=Read-Host "Enter the Name of the Company"
FunctionName($name)
```
```PowerShell
Function GetServiceOnDemand{
    param(
        [string[]]$getServicename
    )
Get-Process -Name $getServicename
}
GetServiceOnDemand -getServicename notepad
```
```PowerShell
function Multiplication{
    param(
        [int]$a,[int]$b
    )
    $c=$a*$b
    Write-Host "The Multiplication of $a and $b is $c"
}

Multiplication -a 5 -b 5
```
### Advance Function
```powerShell
function Multiplication{
    [cmdletBinding()]
    param(
        [int]$a,[int]$b
    )
    $c=$a*$b
    Write-Host "The Multiplication of $a and $b is $c"
}

Multiplication -a 5 -b 5

Get-help Multiplication (CommonParameters Shown here)
 Multiplication [[-a] <int>] [[-b] <int>] [<CommonParameters>]
```
### Syntax for Advance Function
```PowerShell
function Verb-Noun{
    [CmdletBinding()]
    param(
        // Parameters to declare with their Datatypes
    )
    begin{
        // intialization of variable, create a log file
    }
    process{
        // Program code to make this function work
    }
    end{
        //Clearing Values, log Files, etc
    }

}
```
## Array
### Array SUB-EXPRESSION OPERATOR
```PowerShell
$a=@("hello there","I am Here")
$a.Length 
# O/P -: 2
$process=@(Get-Process)
$process.Length
# O/P -: 271
```
### Create and Intializing An Array
```PowerShell
$a=1,2,3,4,5,6,7
$a  
$b=1..7 #(Delimeter)
$b
```
### Reading An Array
```PowerShell
$a=1..9
$a[0]
# O/P -> 1
$a[4..8]
# O/P -> 5 6 7 8 9
```
### Iteration Over Array Elements
```PowerShell
$a=1..9
foreach($i in $a){
    $i;
}

$a=1..9
for($i=0; $i -lt $a.Length ;$i++){
    $a[$i];
}
```
### Manipulating An Array
```PowerShell
$a=1..5
$a[0]=20
foreach($i in $a){
    $i
}
$a.SetValue(203,1)
```
#### Adding an Element in an Array
```PowerShell
$a=1..5
$a+=6
$a
```
#### Removing an Element in an Array
```PowerShell
$a=1..5
$t=($a[1],$a[2],$a[3])
$t
```
#### Combine Two Array
```PowerShell
$a=1..5
$b=6..10
$c=$a+$b
$c
```

## HashTable And Ordered Dictionaries
```PowerShell
$hs=@{"saurabh"=21;"Sciforma"=44}
$hs
$hs=[Ordered]@{"saurabh"=21;"Sciforma"=44}
$hs
```
### Keys and Value
```PowerShell
$hs=[Ordered]@{"saurabh"=21;"Sciforma"=44}
$hs.Values
$hs.Keys

$hs=[Ordered]@{"saurabh"=21;"Sciforma"=44}
$hs["saurabh"]
## O/p -> 21
$hs.saurabh 
## O/p -> 21
```
### Adding Element
```PowerShell
$hs=[Ordered]@{"saurabh"=21;"Sciforma"=44}
$hs["Prashant"]=25

$hs=[Ordered]@{"saurabh"=21;"Sciforma"=44}
$hs.Add("Abhi","28")

```

### Removing
```PowerShell
$hs=[Ordered]@{"saurabh"=21;"Sciforma"=44}
$hs.Remove("saurabh")
$hs
```

## ALIAS
### New-Alias
#### We can Give Command to our own specific Name
```PowerShell
New-Alias -Name Service -Value Get-Service
PS C:\Users\SaurabhSingh\Downloads\PowerShell> Service
Status   Name               DisplayName
------   ----               -----------
Stopped  AarSvc_1008484a    Agent Activation Runtime_1008484a
Running  AdobeARMservice    Adobe Acrobat Update Service
Stopped  ALG                Application Layer Gateway Servic
...............................................................
``` 
### Get-Alias
```PowerShell
Get-Alias -Name Service

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Alias           Service -> Get-Service
```

### Export-Alias
#### Export all alias in file
```PowerShell
Export-Alias -Path ./Test2/Alias.csv
 ```
 #### If we want to not override the file 
 ```PowerShell
  Export-Alias -Path ./Test2/Alias.csv -NoClobber
  O/P-: Export-Alias: The file 'C:\Users\SaurabhSingh\Downloads\PowerShell\Test2\Alias.csv' already exists.
  ```

## REGEX
### SubExpressio                  Matches
#### [...]  => Matches any Single Character in brackets
#### \w => Matches the word Character
#### \d => Matches the Digit. Equivalent to [0-9]
#### $ => Matches the end of the Line.
```PowerShell
'book' -match 'oo'
O/P -> True
```
```PowerShell
'big' -match 'b[iou]g' 
# [iou] -> i.e big or bog or bug if any one of them will occur that will return true as it pattern matching 
O/P -> True
```
```PowerShell
42 -MATCH '[0-4][0-2]'
O/P -> True
```
```PowerShell
"Book" -Match '\w'
O/p -> True
```
```PowerShell
'111-222-3333' -match '\d{3}-\d{3}-\d{4}'
O/P -> True
'11-222-3333' -match '\d{3}-\d{3}-\d{4}'  
# d{3} as it matching the number of digit
O/P -> False
```

```PowerShell
"Booting" -Match '^Boot' 
# ^ For Matching the Starting 
O/P ->True
```
```PowerShell
"Booting" -Match 'g$' 
O/P ->True
```
```PowerShell
"Booting" -Match 'g$'   
O/P ->True
```

## TRY/CATCH/FINALLY
```PowerShell
try {
    $a=10
    $b=0
    $c=$a/$b
}
catch [System.DivideByZeroException] {
    Write-Host "exception $_"
}
Finally{
    Write-Host "Final here."
}
```
## PowerShell Management
### Invoke-Item

```PowerShell
Invoke-Item -Path ./anmol.txt
# This will Open the File anmol.txt in notepad
```
```PowerShell
Invoke-Item -Path ./*.txt
# It will Open all the Txt file in that Path
```
### Set-Service
#### -> It is Use to Change the Status Or Property. It can Stop and Pause the Service
```PowerShell
Set-Service -Name Power -DisplayName PowerSupply
# It will Change Name to Power to PowerSupply  
```
```PowerShell
Set-Service -Name Power -StartupType Automatic
# It will change to StartUpType to Automtic Or we can change to Manual etc.
```
```PowerShell
Set-Service -Name Power -Description "Changing it Description"
# To change the Description
```
### Start-Service
```PowerShell
Start-Service -Name PhoneSvc
```
### Restart-Service
```PowerShell
Restart-Service -Name PhoneSvc
```
### Clear-Item
#### -> Is used to the Delete the Variable
```PowerShell
$test="hello"
PS C:\Users\SaurabhSingh\Downloads\PowerShell> Clear-Item Variable:test
``` 
### Get-ComputerInfo
```PowerShell
Get-ComputerInfo
```
```PowerShell
Get-ComputerInfo -Property "*version"
 ```
### Get-Location
```PowerShell
Get-Location

Path
----
C:\Users\SaurabhSingh\Downloads\PowerShell
```
## Utility
### Join-Path
```PowerShell
Join-Path -Path "Path" -ChildPath "childPath"
Path\childPath
```
```PowerShell
Join-Path -Path C:, D: -ChildPath "New"
C:\New
D:\New
```
## Test-Connection
```PowerShell
Test-Connection -ComputerName www.sciforma.com

   Destination: www.sciforma.com

Ping Source           Address                   Latency BufferSize Status
                                                   (ms)        (B)
---- ------           -------                   ------- ---------- ------
   1 SaurabhSingh-CB… 23.185.0.1                     15         32 Success
   2 SaurabhSingh-CB… 23.185.0.1                     17         32 Success
   3 SaurabhSingh-CB… 23.185.0.1                     13         32 Success
   4 SaurabhSingh-CB… 23.185.0.1                     21         32 Success
```   
```PowerShell
Test-Connection -ComputerName www.sciforma.com -Quiet
# If Any of the Ping is Success than it is True.
True
```
## Archive And Diagnostics
### Compress-Archive
```PowerShell
Compress-Archive -Path ./Test2 -Destination ./Test2/TestZip
# Used to Zip the Folder
```

### Expand-Archive
```PowerShell
Expand-Archive -path ./Test2/TestZip.zip  -Destination ./Test2/
# Used to Unzip the Folder
```
### Out-Host
```PowerShell
Get-Process | Out-Host -Paging
# It will Show the Process the in the Steps.
```
### Out-Null
```Powershell
Get-Process | Out-Null
# Used for Hiding the Output
```
## Utility
### Out-File
```PowerShell
Get-Process | Out-File -Path ./Test2/Out-File.txt
# Used to Put the Output of Get-Process in Out-File.txt
```
```PowerShell
Get-Process | Out-File -Path ./Test2/Out-File.txt -NoClobber
## If File Already Exist It will show the Error
```
### ConvertTo-Html
```PowerShell
ConvertTo-Html -InputObject (Get-Date)

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>HTML TABLE</title>
</head><body>
<table>
<colgroup><col/><col/><col/><col/><col/><col/><col/><col/><col/><col/><col/><col/><col/><col/><col/><col/><col/></colgroup>
<tr><th>DisplayHint</th><th>DateTime</th><th>Date</th><th>Day</th><th>DayOfWeek</th><th>DayOfYear</th><th>Hour</th><th>Kind</th><th>Millisecond</th><th>Microsecond</th><th>Nanosecond</th><th>Minute</th><th>Month</th><th>Second</th><th>Ticks</th><th>TimeOfDay</th><th>Year</th></tr>
<tr><td>DateTime</td><td>22 November 2024 14:21:59</td><td>22-11-2024 00:00:00</td><td>22</td><td>Friday</td><td>327</td><td>14</td><td>Local</td><td>799</td><td>921</td><td>400</td><td>21</td><td>11</td><td>59</td><td>638678821197999214</td><td>14:21:59.7999214</td><td>2024</td></tr>
</table>
</body></html>
```
```Powershell
Get-Alias | ConvertTo-Html | Out-File -FilePath ./Test2/alias.html
Invoke-Item ./Test2/alias.html # (To call this File)
```
### ConvertTo-Json
```PowerShell
(Get-UICulture).calendar | ConvertTo-Json
{
  "MinSupportedDateTime": "0001-01-01T00:00:00",
  "MaxSupportedDateTime": "9999-12-31T23:59:59.9999999",
  "AlgorithmType": 1,
  "CalendarType": 1,
  "Eras": [
    1
  ],
  "TwoDigitYearMax": 2049,
  "IsReadOnly": true
}
```
### ConvertTo-Csv

```PowerShell
Get-Process | ConvertTo-Csv
```

### Get-Date
```PowerShell
Get-Date -Format "dd-MM-yyyy"
22-11-2024
``` 
### ConvertTo-Csv
```PowerShell
 ConvertTo-Csv -InputObject (Get-Date) -Delimiter ';'
"DisplayHint";"DateTime";"Date";"Day";"DayOfWeek";"DayOfYear";"Hour";"Kind";"Millisecond";"Microsecond";"Nanosecond";"Minute";"Month";"Second";"Ticks";"TimeOfDay";"Year"
"DateTime";"22 November 2024 14:45:14";"22-11-2024 00:00:00";"22";"Friday";"327";"14";"Local";"184";"670";"600";"45";"11";"14";"638678835141846706";"14:45:14.1846706";"2024"
```
### Export-Csv
```PowerShell
Get-Process | Export-Csv -path ./Test2/Process.csv
# Exporting all the Process in a Csv File
```
```PowerShell
Get-Process | Select-Object -Property Name,SI | Export-Csv -path ./Test2/Process.csv -NoTypeInformation
```
### Get-Random
```PowerShell
Get-Random -Minimum -100 -Maximum 100                                                 
-66
```
```PowerShell
1,2,3,4,5 | Get-Random
3
```

```PowerShell

PS C:\Users\SaurabhSingh\Downloads\PowerShell> New-Guid

Guid
----
d62d84e8-0712-4db0-9af8-c70cabd6c032
```
## Rest-APi
### Invoke-RestMethod Syntax
```PowerShell
Invoke-RestMethod -Uri <URI> -Method <HTTPMethod> -Headers <Hashtable> -Body <Body>
```
### Post API
```PowerShell
$uri="https://jsonplaceholder.typicode.com/posts"
$data=@{
   
    title="Tomar"
    body="Saurabh Singh"
    userId=2
} | ConvertTo-Json

$response = Invoke-RestMethod -Uri $uri -Method Post -ContentType "application/json" -Body $data
Write-Output $response

## Output -:
title userId body           id
----- ------ ----           --
Tomar      2 Saurabh Singh 101
```

### Get
```PowerShell
$uri="https://jsonplaceholder.typicode.com/posts/2"
$response=Invoke-RestMethod -Uri $uri -Method Get
Write-Output $response

# Output ->
userId id title        body
------ -- -----        ----
     1  2 qui est esse est rerum tempore vitae…
```
### Put 
```PowerShell
$uri="https://jsonplaceholder.typicode.com/posts/2"
$data=@{
   
    title="Tomar"
    body="Saurabh Singh"
    userId=2
} | ConvertTo-Json

$response=Invoke-RestMethod -Uri $uri -Method Put -ContentType "application/json" -Body $data
Write-Output $response
# OutPut ->
body          title userId id
----          ----- ------ --
Saurabh Singh Tomar      2  2
```

### Delete
```PowerShell
$uri="https://jsonplaceholder.typicode.com/posts/2"
$response=Invoke-RestMethod -Uri $uri -Method Delete
```
## Select-Object UseCases -:
```powershell
Get-Process | Select Name, @{name="ID!";exp={"Saurabh"}} -First 5 # Used to create new Column in a table
"A","B","C","D","A","B" | Select-Object -Unique  # ABCD
```
