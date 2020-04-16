using namespace WindowsTerminal
function Save-MSTerminalConfig {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline)][TerminalSettings]$TerminalSetting,
        [IO.FileInfo]$Path = ($TerminalSetting.Path),
        [Switch]$PassThru
    )

    if (-not $Path) {throw 'You specified a generated MSTerminalConfig object, and therefore must specify an output path with -Path to use this command'}
    if ($PSCmdlet.ShouldProcess($TerminalSetting.Path,'Saving Terminal Settings to File')) {
        [Serialize]::ToJson($TerminalSetting) | Out-File $Path
    }

    #> $MSTerminalConfig.Path

    #TODO: Parse the error and find where the errors are
}