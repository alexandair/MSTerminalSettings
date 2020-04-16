using namespace WindowsTerminal
function Get-MSTerminalProfile {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline)][ValidateNotNull()][TerminalSettings]$TerminalSettings = (Get-MSTerminalSetting),
        #Return the default profile
        [Switch]$Default
    )

    if ($Default) {
        $TerminalSettings.Profiles.Defaults
    } else {
        $TerminalSettings.Profiles.List
    }
}