using namespace WindowsTerminal
function Get-MSTerminalProfile {
    [CmdletBinding(DefaultParameterSetName='Filter')]
    param (
        [Parameter(ValueFromPipeline)][ValidateNotNull()][TerminalSettings]$TerminalConfig = (Get-MSTerminalConfig),
        #Return a profile object representing the "defaults" section for the default settings for all profiles
        [Parameter(ParameterSetName='DefaultSettings')][Switch]$DefaultSettings,
        #Return the default configured profile
        [Parameter(ParameterSetName='Default')][Switch]$Default
    )
    dynamicParam {
        $dynamicParams = Get_ObjectDynamicParameters 'WindowsTerminal.ProfileList'
        $dynamicparams.keys.foreach{
            $dynamicparams.$PSItem.attributes[0].ParameterSetName = 'Filter'
        }
        $dynamicParams
    }
    process {
        if ($DefaultSettings) {
            $WTProfile = $TerminalConfig.Profiles.Defaults
        } elseif ($Default) {
            $WTProfile = $TerminalConfig.Profiles.List.where{
                [Guid]($_.guid) -eq [GUID]$TerminalConfig.DefaultProfile
            }
        } else {
            $filters = $PSBoundParameters.psobject.Copy()
            $filters.keys.foreach{
                if ($PSItem -notin [ProfileList].DeclaredProperties.Name) { $filters.remove($PSItem) }
            }
            $WTProfile = $TerminalConfig.Profiles.List
            foreach ($filterItem in $filters.keys) {
                $WTProfile = $WTProfile.where{$PSItem.$FilterItem -like $Filters.$FilterItem}
            }
        }

        #Add the parent to the item to reference later for saving
        $WTProfile | Add-Member -NotePropertyName 'TerminalConfig' -NotePropertyValue $TerminalConfig
        return $WTProfile
    }
}