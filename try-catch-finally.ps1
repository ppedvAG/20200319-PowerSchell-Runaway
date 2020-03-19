
$session = New-CimSession -ComputerName localhost

try
{    
    Get-CimInstance -CimSession $session -ClassName Win32_OperatingSystem | Select-Object -Property PSComputername,LastBootUpTime
}
catch [System.TimeoutException]
{
    Send-MailMessage 
}
catch [DivideByZeroException]
{
    Write-Host "Ausnahme: Division durch Null"
}
catch [System.Net.WebException],[System.Exception]
{
    Write-Host "Weitere Ausnahme"
}
finally
{
    $session.Close()
    Write-Host "Bereinigung wird ausgeführt..."
}