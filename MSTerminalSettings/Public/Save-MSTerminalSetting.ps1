using namespace WindowsTerminal
function Save-MSTerminalSetting {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(ValueFromPipeline)][TerminalSettings]$MSTerminalSetting,
        [IO.FileInfo]$Path = (Join-Path (find-msterminalfolder) 'profiles.json')
    )
    [Serialize]::ToJson($MSTerminalSetting)

    #TODO: Parse the error and find where the errors are
}