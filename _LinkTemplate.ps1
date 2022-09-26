param($destination, $target)

if (Test-Path -Path "$destination") 
{
    Remove-Item -Path "$destination" -Recurse
}
New-Item -ItemType SymbolicLink -Path "$destination" -Target (Get-Item $target).FullName
