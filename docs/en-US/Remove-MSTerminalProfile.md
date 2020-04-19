---
external help file: MSTerminalSettings-help.xml
Module Name: MSTerminalSettings
online version:
schema: 2.0.0
---

# Remove-MSTerminalProfile

## SYNOPSIS
Removes a MS Terminal profile

## SYNTAX

```
Remove-MSTerminalProfile [[-Guid] <Guid>] [[-TerminalSettings] <TerminalSettings>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Removes a MS Terminal profile

## EXAMPLES

### Example 1
```powershell
PS C:\> Remove-MSTerminalProfile -name pwsh
```

Removes any terminal profiles with the name "pwsh"

### Example 2
```powershell
PS C:\> Get-MSTerminalProfile -Name pwsh | Remove-MSTerminalProfile
```

Removes any terminal profiles with the name "pwsh"

## PARAMETERS

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Guid
{{ Fill Guid Description }}

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -TerminalSettings
{{ Fill TerminalSettings Description }}

```yaml
Type: TerminalSettings
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Object

## OUTPUTS

### None

## NOTES

## RELATED LINKS
