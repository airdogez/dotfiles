Set-PSReadlineOption -EditMode vi -BellStyle None
Set-Alias lvim ~\.local\bin\lvim.ps1

function which ($command)
{
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

Invoke-Expression (&starship init powershell)
