using namespace WindowsTerminal
function Set-MSTerminalProfile {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline)][ValidateNotNullOrEmpty()][ProfileList]$Profile
    )
    DynamicParam {
        Get-ObjectDynamicParameters 'WindowsTerminal.ProfileList'
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