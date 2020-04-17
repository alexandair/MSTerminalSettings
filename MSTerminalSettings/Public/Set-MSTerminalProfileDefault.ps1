using namespace WindowsTerminal
function Set-MSTerminalProfileDefault {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline)][ValidateNotNullOrEmpty()][Profile]$Profile = (Get-MSTerminalProfile -Default)
    )
    DynamicParam {
        Get_ObjectDynamicParameters 'WindowsTerminal.Profile'
    }
    process {
        $settings = $PSBoundParameters.psobject.Copy()
        'Profile' | foreach {
            if ($PSItem -in $settings.keys) {$settings.Remove($PSItem)}
        }
        foreach ($settingItem in $settings.keys) {
            $Profile.$SettingItem = $settings[$SettingItem]
            Save-MSTerminalConfig $Profile.TerminalSettings
        }
    }
}