function Remove-MSTerminalProfile {
    throw [System.NotImplementedException]
}

# function Remove-MSTerminalProfile {
#      [CmdletBinding(DefaultParameterSetName="Name",SupportsShouldProcess=$true,ConfirmImpact="High")]
#     param(
#         [Parameter(Mandatory=$true,ParameterSetname="Name")]
#         [string]$Name,

#         [Parameter(Mandatory=$true,ParameterSetName="InputObject",ValueFromPipeline=$true)]
#         $InputObject
#     )
#     begin {
#                 #FIXME: Remove When Refactored
#                 throwuser $QuickTypeNotImplementedException
#         $Path = Find-MSTerminalFolder
#         $SettingsPath = Join-Path $Path "profiles.json"
#         $Settings = ReadMSTerminalProfileJson $SettingsPath
#         $WTProfileToRemove = @()
#     }
#     process {
#         if($PSCmdlet.ParametersetName -eq "Name") {
#             $InputObject = Get-MSTerminalProfile -name $Name
#         }

#         $InputObject | ForEach-Object {
#             $TerminalProfile = $_
#             $Settings.profiles | ForEach-Object {
#                 if($_.guid -eq $TerminalProfile.guid) {
#                     $WTProfileToRemove += $_
#                 }
#             }
#         }
#     }
#     end {
#         if($WTProfileToRemove.Count -gt 0 -and $PSCmdlet.ShouldProcess($WTProfileToRemove.Name, "Remove MS Terminal profiles")) {
#             $RemoveGuids = @($WTProfileToRemove.Guid)
#             $RemainingProfiles = @($Settings.Profiles | Where-Object {
#                 $_.Guid -notin $RemoveGuids
#             })
#             $Settings.Profiles = $RemainingProfiles
#             ConvertTo-Json $Settings -Depth 10 | Set-Content -Path $SettingsPath
#         }
#     }
# }