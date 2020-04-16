function Get-MSTerminalColorScheme {
        #FIXME: Remove When Refactored
        throwuser $QuickTypeNotImplementedException
    param(
        $Name
    )
    $Path = Find-MSTerminalFolder
    $SettingsPath = Join-Path $Path "profiles.json"
    $Settings = ReadMSTerminalProfileJson $SettingsPath

    $Settings.Schemes | Where-Object {
        if($Name) {
            $_.Name -like $Name
        } else {
            $true
        }
    }
}