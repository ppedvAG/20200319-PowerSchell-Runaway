#Abfragen von Credentials
$Credential = Get-Credential

#erstellen der Session
$session = New-PSSession -ComputerName member1 -Credential $Credential

#Sktip Logik
Invoke-Command -Session $session {Get-Date | Out-File C:\datum.txt -Append}

Invoke-Command -Session $session {shutdown -r -t 1}

#warten das das Remote System wieder Online kommt
do
{
    Start-Sleep -Seconds 20
}until(Test-Connection -ComputerName Member1 -Count 1 -Quiet)

#reconnect der session
$session = New-PSSession -ComputerName member1 -Credential $Credential

#weitere SkriptLogik
Invoke-Command -Session $session {Get-Date | Out-File C:\datum.txt -Append}

#kopieren von Dateien zwischen Host und remote Host via PS Session, nicht geeignet für größere Dateien, ideal für text und log dateien zb.
Copy-Item -FromSession $session -Path C:\datum.txt -Destination C:\datum.txt