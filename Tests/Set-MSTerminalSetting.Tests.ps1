[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '', Scope='*', Target='SuppressImportModule')]
$SuppressImportModule = $false
. $PSScriptRoot\Shared.ps1

Describe "Set-MSTerminalConfig" {
    Mock Find-MSTerminalFolder -ModuleName MSTerminalSettings -MockWith {
        $TestDrive
    }
    BeforeEach {
        Copy-Item $PSScriptRoot/Profiles/MainSettings.json $TestDrive/profiles.json
    }
    It "Sets alwaysShowTabs" {
        Set-MSTerminalConfig -AlwaysShowTabs:$false
        $Settings = (Get-Content $TestDrive/profiles.json | ConvertFrom-Json).Globals
        $Settings.alwaysShowTabs | Should -Be $false
    }
    It "Sets defaultProfile" {
        Set-MSTerminalConfig -defaultProfile 24
        $Settings = (Get-Content $TestDrive/profiles.json | ConvertFrom-Json).Globals
        $Settings.defaultProfile | Should -Be 24
    }
    It "Sets disabledProfileSources" {
        Set-MSTerminalConfig -disabledProfileSources @("Windows.Terminal.Azure")
        $Settings = (Get-Content $TestDrive/profiles.json | ConvertFrom-Json).Globals
        $Settings.disabledProfileSources -contains "Windows.Terminal.Azure" | Should -Be $true
    }
    It "Sets showTabsInTitlebar" {
        Set-MSTerminalConfig -showTabsInTitlebar:$false
        $Settings = (Get-Content $TestDrive/profiles.json | ConvertFrom-Json).Globals
        $Settings.showTabsInTitlebar | Should -Be $false
    }
    It "Sets initialCols" {
        Set-MSTerminalConfig -initialCols 24
        $Settings = (Get-Content $TestDrive/profiles.json | ConvertFrom-Json).Globals
        $Settings.initialCols | Should -Be 24
    }
    It "Sets initialRows" {
        Set-MSTerminalConfig -initialRows 24
        $Settings = (Get-Content $TestDrive/profiles.json | ConvertFrom-Json).Globals
        $Settings.initialRows | Should -Be 24
    }
    It "Sets requestedTheme" {
        Set-MSTerminalConfig -requestedTheme dark
        $Settings = (Get-Content $TestDrive/profiles.json | ConvertFrom-Json).Globals
        $Settings.requestedTheme | Should -Be dark
    }
    It "Sets showTerminalTitleInTitlebar" {
        Set-MSTerminalConfig -showTerminalTitleInTitlebar:$false
        $Settings = (Get-Content $TestDrive/profiles.json | ConvertFrom-Json).Globals
        $Settings.showTerminalTitleInTitlebar | Should -Be $false
    }
    It "Preserves the property order in the json file" {
        $OrderBefore = (Get-Content $TestDrive/profiles.json -Raw | ConvertFrom-Json).Globals.PSObject.Properties.Name -Join ""
        Set-MSTerminalConfig -initialCols (Get-MSTerminalConfig).initialCols
        $OrderAfter = (Get-Content $TestDrive/profiles.json -Raw | ConvertFrom-Json).Globals.PSObject.Properties.Name -Join ""
        $OrderAfter | Should -Be $OrderBefore
    }
}
