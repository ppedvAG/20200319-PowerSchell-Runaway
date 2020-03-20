

function myfunction{
[cmdletBinding()]
param(
    [string]$eingabe
)

    Write-Host -ForegroundColor Magenta "Functioninhalt: $eingabe"

    $eingabe.ToUpper()
    return 

}

$scopetest = "Vor Function"
Write-Host -ForegroundColor Green "Scopetestinhalt: $Scopetest"
myfunction -eingabe "FunctionText"
Write-Host -ForegroundColor Green "Scopetestinhalt: $Scopetest"


