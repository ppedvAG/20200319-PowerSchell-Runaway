

$Destinationpath = "C:\testfiles2\"
$DirCount = 2
$FileCount = 2

for($i=1;$i -le $DirCount; $i++)
{
    $DirName = $Destinationpath + "DIR-$("{0:D3}" -f $i)"  
    New-Item -Path $DirName -ItemType Directory

    for($j=1; $j -le $FileCount; $j ++)
    {
        $Filename = $DirName + "\File-$("{0:D3}" -f $j).txt"
        New-Item -Path $Filename -ItemType File
        Get-Date | Out-File -Append -FilePath $Filename
    }
}

