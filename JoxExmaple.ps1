
#erstellen eines Jobs
Start-Job -Name GetTestFiles -ScriptBlock {Get-ChildItem -Path C:\Testfiles -Recurse; Start-Sleep -Seconds 25}

#erhalten der JobErgebnisse der Parameter -Keep behält die daten bei die normalerweise bei Abfrage gelöscht werden
Get-Job -Id 4 | Receive-Job 

#wartet auf Background Jobs
Wait-Job

#Job Example Block mit Await
$job = Start-Job -Name Awaitjobtext -ScriptBlock {Get-Date; Start-Sleep -Seconds 60}
Write-Host -ForegroundColor Magenta "Verarbeite Informationen mit Skriptlogik (paralell)"

$job | Wait-Job
$ergeb = $job | Receive-Job -Keep

Write-Host -ForegroundColor Green "Ergebnis des jobs" $ergeb

