using namespace WindowsTerminal
function Save-MSTerminalConfig {
    [CmdletBinding(DefaultParameterSetName='InputObject')]
    param (
        [Parameter(Position=0,ParameterSetName='InputObject',Mandatory,ValueFromPipeline)][TerminalSettings]$TerminalConfig,
        [ValidateNotNullOrEmpty()][IO.FileInfo]$Path,
        [Switch]$PassThru
    )

    if ($TerminalConfig -and -not $TerminalConfig.Path) {throw 'You specified a generated MSTerminalConfig object, and therefore must specify an output path with -Path to use this command'}
    if (-not $Path -and $TerminalConfig.Path) {$Path = $TerminalConfig.Path}
    if ($PSCmdlet.ShouldProcess($TerminalConfig.Path,'Saving Terminal Settings to File')) {
        [Serialize]::ToJson($TerminalConfig) | Out-File $Path
    }

    #> $MSTerminalConfig.Path

    #TODO: Parse the error and find where the errors are
}