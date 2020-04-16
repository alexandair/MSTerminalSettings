[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '', Scope='*', Target='SuppressImportModule')]
$SuppressImportModule = $false
. $PSScriptRoot\Shared.ps1

Describe "Remove-MSTerminalWordDelimiter" {
    Mock Find-MSTerminalFolder -ModuleName MSTerminalConfig -MockWith {
        $TestDrive
    }

    context "Default values" {
        BeforeEach {
            Copy-Item $PSScriptRoot/Profiles/OneProfile.json $TestDrive/profiles.json
        }

        It "Removes a single delimiter" {
            $ExpectedDelimiters = (Get-MSTerminalConfig).WordDelimiters.Replace("?", "")
            Remove-MSTerminalWordDelimiter -Delimiter "?"
            (Get-MSTerminalConfig).WordDelimiters | Should -Be $ExpectedDelimiters
        }

        It "Removes multiple delimiters" {
            $ExpectedDelimiters = (Get-MSTerminalConfig).WordDelimiters.Replace("?","").Replace("*","").Replace("+", "")
            Remove-MSTerminalWordDelimiter -Delimiter "?*+"
            (Get-MSTerminalConfig).WordDelimiters | Should -Be $ExpectedDelimiters
        }
    }
}
