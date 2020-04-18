using namespace WindowsTerminal
function Add-MSTerminalColorScheme {
    param(
        [Parameter(ValueFromPipeline)][ValidateNotNull()][TerminalSettings]$TerminalSettings = (Get-MSTerminalConfig)
    )
    DynamicParam {
        Get-ObjectDynamicParameters 'WindowsTerminal.SchemeList' -MandatoryParameters 'Name'
    }
    process {
        $settings = $PSBoundParameters.psobject.Copy()
        foreach ($settingItem in $settings.keys) {
            #Skip any custom parameters we may have added in the param block
            if ($settingItem -notin [SchemeList].DeclaredProperties.Name) { $settings.remove($settingItem) }
        }

        $newScheme = [SchemeList]$settings
        $TerminalSettings.Schemes.add($newScheme) > $null
        Save-MSTerminalConfig $TerminalSettings
    }
}