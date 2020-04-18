using namespace WindowsTerminal
using namespace System.Collections.Generic
function Get-MSTerminalColorScheme {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)][TerminalSettings]$InputObject = (Get-MSTerminalConfig),
        #Exclude the default color schemes
        [Switch]$ExcludeDefault
    )
    dynamicParam {
        Get-ObjectDynamicParameters 'WindowsTerminal.SchemeList'
    }
    begin {
        if (-not $ExcludeDefault) {
            $DefaultSettingsPath = Join-Path (get-appxpackage 'Microsoft.WindowsTerminal').installLocation 'defaults.json'
            [List[SchemeList]]$ColorScheme = (Get-Content -Raw $DefaultSettingsPath | ConvertFrom-Json).schemes
        } else {
            [List[SchemeList]]$ColorScheme = @()
        }
    }
    process {
        foreach ($schemeItem in $InputObject.Schemes) {$ColorScheme.Add($schemeItem)}
        $filters = $PSBoundParameters.psobject.Copy()
        $filters.keys.foreach{
            if ($PSItem -notin [SchemeList].DeclaredProperties.Name) { [void]$filters.Remove($PSItem) }
        }
        foreach ($filterItem in $filters.keys) {
            $ColorScheme = [SchemeList[]]$ColorScheme.where{$PSItem.$FilterItem -like $Filters.$FilterItem}
        }
        return [List[SchemeList]]$ColorScheme
    }
}