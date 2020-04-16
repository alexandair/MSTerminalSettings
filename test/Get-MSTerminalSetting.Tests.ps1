[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '', Scope='*', Target='SuppressImportModule')]
$SuppressImportModule = $false
. $PSScriptRoot\Shared.ps1

Describe "Get-MSTerminalConfig" {
    Mock Find-MSTerminalFolder -ModuleName MSTerminalConfig -MockWith {
        $TestDrive
    }
    BeforeEach {
        Copy-Item $PSScriptRoot/Profiles/MainSettings.json $TestDrive/profiles.json
    }
    It "Reads alwaysShowTabs" {
        $Value = (Get-MSTerminalConfig).alwaysShowTabs
        $Value | Should -Be $true
    }
    It "Reads defaultProfile" {
        $Value = (Get-MSTerminalConfig).defaultProfile
        $Value | Should -Be "42"
    }
    It "Reads showTabsInTitlebar" {
        $Value = (Get-MSTerminalConfig).showTabsInTitlebar
        $Value | Should -Be $true
    }
    It "Reads initialCols" {
        $Value = (Get-MSTerminalConfig).initialCols
        $Value | Should -Be 42
    }
    It "Reads initialRows" {
        $Value = (Get-MSTerminalConfig).initialRows
        $Value | Should -Be 42
    }
    It "Reads requestedTheme" {
        $Value = (Get-MSTerminalConfig).requestedTheme
        $Value | Should -Be "42"
    }
    It "Reads showTerminalTitleInTitlebar" {
        $Value = (Get-MSTerminalConfig).showTerminalTitleInTitlebar
        $Value | Should -Be $true
    }
}
