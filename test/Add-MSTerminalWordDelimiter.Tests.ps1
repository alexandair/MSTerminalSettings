[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '', Scope='*', Target='SuppressImportModule')]
$SuppressImportModule = $false
. $PSScriptRoot\Shared.ps1

Describe "Add-MSTerminalWordDelimiter" {
    Mock Find-MSTerminalFolder -ModuleName MSTerminalConfig -MockWith {
        $TestDrive
    }

    context "Default values" {
        BeforeEach {
            Copy-Item $PSScriptRoot/Profiles/OneProfile.json $TestDrive/profiles.json
        }

        It "Adds a single delimiter" {
            $ExpectedDelimiters = (Get-MSTerminalConfig).WordDelimiters + "x"
            Add-MSTerminalWordDelimiter -Delimiter "x"
            (Get-MSTerminalConfig).WordDelimiters | Should -Be $ExpectedDelimiters
        }

        It "Adds multiple delimiters" {
            $ExpectedDelimiters = (Get-MSTerminalConfig).WordDelimiters + "abc"
            Add-MSTerminalWordDelimiter -Delimiter "abc"
            (Get-MSTerminalConfig).WordDelimiters | Should -Be $ExpectedDelimiters
        }
    }
}
