---
external help file: MSTerminalSettings-help.xml
Module Name: MSTerminalSettings
online version:
schema: 2.0.0
---

# Get-MSTerminalConfig

## SYNOPSIS
Returns the current top-level settings for MS Terminal.

## SYNTAX

```
Get-MSTerminalConfig [[-Path] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the current top-level settings for MS Terminal.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-MSTerminalConfig

defaultProfile                  : {38782937-4ba3-4696-9ae1-0bfc33c60e62}
initialRows                     : 30
initialCols                     : 120
alwaysShowTabs                  : True
showTerminalTitleInTitlebar     : True
showTabsInTitlebar              : False
requestedTheme                  : system
keybindings                     : {@{keys=System.Object[]; command=closeTab},...}
```

Returns the current top-level settings for MS Terminal.

## PARAMETERS

### -Path
{{ Fill Path Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
