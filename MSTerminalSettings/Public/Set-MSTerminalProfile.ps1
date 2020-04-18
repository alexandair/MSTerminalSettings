using namespace WindowsTerminal
function Set-MSTerminalProfile {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline)][ProfileList]$InputObject,
        #Set the profile as the default profile used for new tabs and on startup
        [Switch]$MakeDefault
    )
    DynamicParam {
        Get-ObjectDynamicParameters 'WindowsTerminal.ProfileList'
    }
    process {
        #If no profile was specified, operate on the "defaults" profile, meaning
        if (-not $InputObject) { $InputObject = Get-MSTerminalProfile -Default }

        $settings = $PSBoundParameters.psobject.Copy()
        foreach ($settingItem in $settings.keys) {
            #Skip any custom parameters we may have added in the param block
            if ($settingItem -notin [ProfileList].DeclaredProperties.Name) { continue }

            $InputObject.$settingItem = $settings[$settingItem]
            Save-MSTerminalConfig $InputObject.TerminalConfig
        }
        if ($MakeDefault) {
            Get-MSTerminalConfig |
                Set-MSTerminalConfig -DefaultProfile $InputObject.GUID
        }
    }
}