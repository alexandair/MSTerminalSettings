using namespace WindowsTerminal
function Set-MSTerminalConfig {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline)][ValidateNotNull()][TerminalSettings]$TerminalSettings = (Get-MSTerminalConfig)
    )
    DynamicParam {
        Get_ObjectDynamicParameters 'WindowsTerminal.TerminalSettings'
    }
    process {
        $settings = $PSBoundParameters.psobject.Copy()
        'TerminalSettings' | foreach {
            if ($PSItem -in $settings.keys) {$settings.Remove($PSItem)}
        }
        foreach ($settingItem in $settings.keys) {
            $TerminalSettings.$SettingItem = $settings[$SettingItem]
            Save-MSTerminalConfig $TerminalSettings
        }
    }
}

# function Set-MSTerminalConfig {
#     [CmdletBinding(SupportsShouldProcess=$true)]
#     param(
#         [string]$DefaultProfile,

#         [ValidateRange(1,[int]::MaxValue)]
#         [int]$InitialRows,

#         [ValidateRange(1,[int]::MaxValue)]
#         [int]$InitialCols,

#         [Switch]$AlwaysShowTabs,

#         [ValidateSet("light","dark","system")]
#         [string]$RequestedTheme,

#         [Switch]$ShowTerminalTitleInTitlebar,

#         [Switch]$ShowTabsInTitlebar,

#         [String]$WordDelimiters,

#         [switch]$CopyOnSelect,

#         [ValidateSet("Windows.Terminal.Azure","Windows.Terminal.PowershellCore","Windows.Terminal.Wsl","")]
#         [string[]]$DisabledProfileSources,

#         [string[]]$Clear,

#         [hashtable]$ExtraSettings = @{}
#     )
#             #FIXME: Remove When Refactored
#             throwuser $QuickTypeNotImplementedException
#     $Path = Find-MSTerminalFolder
#     $SettingsPath = Join-Path $Path "profiles.json"
#     # Don't use -AsHashtable for 5.1 support
#     $Settings = ReadMSTerminalProfileJson $SettingsPath | ConvertPSObjectToHashtable
#     if($Settings.Globals) {
#         $SettingsRoot = $Settings["globals"]
#     } else {
#         $SettingsRoot = $Settings
#     }

#     $Properties = @(
#         "alwaysShowTabs",
#         "copyOnSelect",
#         "defaultProfile",
#         "disabledProfileSources",
#         "initialRows",
#         "initialCols",
#         "requestedTheme",
#         "showTabsInTitlebar",
#         "showTerminalTitleInTitlebar",
#         "wordDelimiters"
#     )
#     CopyHashtable -Source $PSBoundParameters -Destination $SettingsRoot -Keys $Properties
#     if($ExtraSettings.Count -gt 0) {
#         CopyHashtable -Source $Extra -Destination $SettingsRoot
#     }
#     if($Clear) {
#         $Clear | ForEach-Object {
#             $ClearKey = $_
#             $Keys = $SettingsRoot.Keys | ForEach-Object {$_}
#             $Keys | ForEach-Object {
#                 if($_ -eq $ClearKey) {
#                     $SettingsRoot.Remove($_)
#                 }
#             }
#         }
#     }

#     if($PSCmdlet.ShouldProcess("update MS Terminal settings")) {
#         ConvertTo-Json $Settings -Depth 10 | Set-Content -Path $SettingsPath
#     }
# }