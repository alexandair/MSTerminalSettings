function Get-MSTerminalSetting {
    [CmdletBinding()]
    param (
        #Path to the profile.json settings file you want to work with. Defaults to the default location
        [IO.FileInfo]$Path = (Join-Path (Find-MSTerminalFolder) 'profiles.json')
    )
    try {
        [TerminalSettings]::FromJson(
            (
                Get-Content -Raw $Path
            )
        )
    } catch [Newtonsoft.Json.JsonSerializationException] {
        if ($PSItem -match "cannot deserialize.+ProfilesObject.+requires a json object") {
            throwuser "Error while parsing $Path`: This module only supports the newer 'Defaults and List' method of defining Windows Terminal profiles. Please edit your profile accordingly. See https://github.com/microsoft/terminal/blob/master/doc/user-docs/UsingJsonSettings.md#default-settings for details. The default profile.json conforms to this format."
        } else {
            throw $PSItem
        }
    }
}