function Add-MSTerminalWordDelimiter {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseDeclaredVarsMoreThanAssignments", "Changed")]
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        $Delimiter
    )

    #FIXME: Remove When Refactored
    throwuser $QuickTypeNotImplementedException

    $Settings = Get-MSTerminalConfig
    $Changed = $false
    $Delimiter.ToCharArray() | ForEach-Object {
        if($Settings.wordDelimiters -and !$Settings.wordDelimiters.Contains($_) -and $PSCmdlet.ShouldProcess("Add delimiters $Delimiter")) {
            $Settings.WordDelimiters += $_
            $Changed = $true
        }
    }
    if($Changed) {
        Set-MSTerminalConfig -WordDelimiters $Settings.WordDelimiters
    }
}