function ReadMSTerminalProfileJson ([String]$Path) {
    [TerminalSettings]::FromJson(
        (
            Get-Content -Raw $Path
        )
    )
}