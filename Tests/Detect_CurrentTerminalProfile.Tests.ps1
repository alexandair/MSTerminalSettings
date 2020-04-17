Describe "Detect_CurrentTerminalProfile" {
    . $PSScriptRoot\Shared.ps1
    InModuleScope MSTerminalSettings {
        $env:WT_SESSION = 'pester'
        Mock Find-MSTerminalFolder -ModuleName MSTerminalSettings -MockWith {
            $TestDrive
        }
        Copy-Item $Mocks/DefaultUserSettings.json $TestDrive/profiles.json

        It "Detects powershell" {
            $env:WT_PROFILE_ID = $null
            Mock Get-Process {@{
                Path = 'C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe'
                ProcessName = 'powershell'
            }}
            (Detect_CurrentTerminalProfile).Name | Should -Be 'Windows Powershell'
        }
        It "Detects pwsh" {
            $env:WT_PROFILE_ID = $null
            Mock Get-Process {@{
                ProcessName = 'pwsh'
            }}
            (Detect_CurrentTerminalProfile).Name | Should -Be 'Powershell'
        }
        It "Detects `$env:WT_PROFILE_ID by Name" {
            $env:WT_PROFILE_ID = 'Windows Powershell'
            (Detect_CurrentTerminalProfile).Name | Should -Be 'Windows Powershell'
        }
        It "Detects `$env:WT_PROFILE_ID by GUID" {
            $env:WT_PROFILE_ID = '{61c54bbd-c2c6-5271-96e7-009a87ff44bf}'
            (Detect_CurrentTerminalProfile).Name | Should -Be 'Windows Powershell'
        }
    }




}