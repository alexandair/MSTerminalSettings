function Get-PSCommonParameters {
    [CmdletBinding()]
    param()
    $MyInvocation.MyCommand.Parameters.Keys
}