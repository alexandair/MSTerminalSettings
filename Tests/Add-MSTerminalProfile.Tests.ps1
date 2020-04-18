[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '', Scope='*', Target='SuppressImportModule')]
$SuppressImportModule = $false
. $PSScriptRoot\Shared.ps1

Describe "Add-MSTerminalProfile" {
    Mock Find-MSTerminalFolder -ModuleName MSTerminalSettings -MockWith {
        $TestDrive
    }

    BeforeEach {
        Copy-Item $Mocks/DefaultUserSettings.json $TestDrive/profiles.json
    }

    It "Adds a new profile" {
        $NewValues = @{
            Name = "new-pester"
            useAcrylic = $true
            fontFace = "new-pester-font-face"
            cursorColor = "#newpester"
            padding = '11,11,11,11'
            commandLine = "new-pester.exe"
            icon = "ms-appx:///new-pester.png"
            background = "#new-pester"
            backgroundImageAlignment = "bottomRight"
            fontSize = 11
            closeOnExit = $true
            snapOnInput = $true
            colorScheme = "new-pester"
            historySize = 11
            acrylicOpacity = 0.11
            cursorShape = "vintage"
            startingDirectory = "new-pester"
            hidden = $true
            source = "Windows.Terminal.PowershellCore"
            Guid = "{$(([Guid]::NewGuid().Guid))}"
        }
        Add-MSTerminalProfile @NewValues
        $NewProfile = Get-MSTerminalProfile -Name new-pester
        $NewProfile | Should -Not -Be $null
        $NewValues.Keys | ForEach-Object {
            $ExpectedValue = $NewValues[$_]
            $ActualValue = $NewProfile."$_"
            $ActualValue | Should -Be $ExpectedValue
        }
    }

    It "Updates the default profile in globals" {
        $Before = Get-Content $TestDrive/profiles.json | ConvertFrom-Json | ForEach-Object {$_}
        Add-MSTerminalProfile -Name "test default" -CommandLine "default" -MakeDefault
        $After = Get-Content $TestDrive/profiles.json | ConvertFrom-Json | ForEach-Object {$_}
        $After.defaultProfile | Should -Not -Be $Before.defaultProfile
    }

    It "Generates a guid when one is not provided" {
        Add-MSTerminalProfile -Name NoGuid -CommandLine NoGuid.exe
        (Get-MSTerminalProfile -name NoGuid).Guid | Should -Not -Be $null
    }
}