[cmdletBinding(PositionalBinding=$false)]
Param(

[ValidateScript({Test-Path -Path $PSItem -IsValid})]
[Parameter(Mandatory=$true, ParameterSetName="Set1",HelpMessage="Ordner zum erstellen von Testfiles" )]
[string]$Destinationpath,

[ValidateRange(5,100)]
[Parameter()]
[int]$DirCount = 2,

[ValidateRange(5,100)]
[Parameter()]
[int]$FileCount = 2,

[ValidateSet("Date","ipconfig","Hostname")]
[Parameter()]
[string]$Filecontent = "Date",

[Parameter()]
[switch]$Clear

)

if((Test-Path -Path $Destinationpath) -and $Clear)
{
    Remove-Item -Path $Destinationpath -Force -Recurse
}

switch($Filecontent)
{
    "Date"     {$content = Get-Date}
    "ipconfig" {$content = Get-NetIPConfiguration}
    "Hostname" {$content = $env:COMPUTERNAME}
    default    {$content = "Wrong Filecontent"}
}


for($i=1;$i -le $DirCount; $i++)
{
    if($Destinationpath.EndsWith("\") -eq $false)
    {
        $Destinationpath += "\"
    }
    $DirName = $Destinationpath + "DIR-$("{0:D3}" -f $i)"  
    New-Item -Path $DirName -ItemType Directory

    for($j=1; $j -le $FileCount; $j ++)
    {
        if($DirName.EndsWith("\") -eq $false)
        {
            $DirName += "\"
        }
        $Filename = $DirName + "\File-$("{0:D3}" -f $j).txt"
        New-Item -Path $Filename -ItemType File
        Out-File -Append -FilePath $Filename -InputObject $content
    }
}

