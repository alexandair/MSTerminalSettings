---
external help file: MSTerminalSettings-help.xml
Module Name: MSTerminalSettings
online version:
schema: 2.0.0
---

# Invoke-MSTerminalGif

## SYNOPSIS
Plays a gif from a URI to the terminal.
Useful when used as part of programs or build scripts to show "reaction gifs" to the terminal to events.

## SYNTAX

```
Invoke-MSTerminalGif [-Uri] <Uri> [[-Name] <String>] [[-StretchMode] <BackgroundImageStretchMode>]
 [[-BackgroundImageOpacity] <Single>] [-Acrylic] [[-MaxDuration] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
This command plays animated GIFs on the Windows Terminal.
It performs the operation in a background runspace and only allows one playback at a time.
It also remembers your previous windows terminal settings and puts them back after it is done

## EXAMPLES

### EXAMPLE 1
```
Invoke-MSTerminalGif https://media.giphy.com/media/g9582DNuQppxC/giphy.gif
Triggers a gif in the current Windows Terminal
```

## PARAMETERS

### -Uri
The URI of the GIF you want to display

```yaml
Type: Uri
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name or GUID of the Windows Terminal Profile in which to play the Gif.

```yaml
Type: String
Parameter Sets: (All)
Aliases: GUID

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StretchMode
How to resize the background image in the window.
Options are None, Fill, Uniform, and UniformToFill

```yaml
Type: BackgroundImageStretchMode
Parameter Sets: (All)
Aliases:
Accepted values: Fill, None, Uniform, UniformToFill

Required: False
Position: 3
Default value: UniformToFill
Accept pipeline input: False
Accept wildcard characters: False
```

### -BackgroundImageOpacity
How transparent to make the background image.
Default is 60% (.6)

```yaml
Type: Single
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0.6
Accept pipeline input: False
Accept wildcard characters: False
```

### -Acrylic
Specify this to use the Acrylic visual effect (semi-transparency)

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxDuration
Maximum duration of the gif invocation in seconds

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 5
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
