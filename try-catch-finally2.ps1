 cls

 [string]$stopproccesserror

 try
 {
    Get-Service | Stop-Process -WhatIf -ErrorAction Stop -ErrorVariable stopproccesserror
 }
 catch [System.OutOfMemoryException]
 {
    $fehlerfrei = $false
    Write-Host -ForegroundColor Red "Uppsala da war ein Fehler"
 }
 catch
 {
    $fehlerfrei = $false
    Write-Host -ForegroundColor Red "Uppsala da war ein Fehler"
    Break
 }
 Finally
 {
    
 }

 $fehlerfrei