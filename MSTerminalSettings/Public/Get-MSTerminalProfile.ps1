using namespace WindowsTerminal
function Get-MSTerminalProfile {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline)][ValidateNotNull()][TerminalSettings]$TerminalSettings = (Get-MSTerminalSetting),
        #Return the default profile
        [Switch]$Default
    )
    dynamicParam {
        Get-ObjectDynamicParameters 'WindowsTerminal.ProfileList'
    }
    process {
        $filters = $PSBoundParameters.psobject.Copy()
        'Default','TerminalSettings' | foreach {
            if ($PSItem -in $filters.keys) {$filters.Remove($PSItem) > $null}
        }

        if ($Default) {
            $profiles = $TerminalSettings.Profiles.Defaults
        } else {
            $profiles = $TerminalSettings.Profiles.List
            foreach ($filterItem in $filters.keys) {
                $profiles = $profiles.where{$PSItem.$FilterItem -like $Filters.$FilterItem}
            }
        }

        #Add the parent to the item to reference later for saving
        $profiles | Add-Member -NotePropertyName 'TerminalSettings' -NotePropertyValue $TerminalSettings
        return $profiles
    }
}