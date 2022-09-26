New-Item -ItemType SymbolicLink -Path "~/.config/starship.toml" -Target (Get-Item ./starship.toml).FullName
