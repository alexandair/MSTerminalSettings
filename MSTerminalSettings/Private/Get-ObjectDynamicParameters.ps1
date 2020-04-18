using namespace System.Management.Automation
using namespace System.Collections.ObjectModel
function Get-ObjectDynamicParameters {
    param(
        #The type to retrieve the dynamic parameters
        [Type]$Type,
        #Which Properties should be Mandatory
        [String[]]$MandatoryProperties
    )
    $dynamicParams = [RuntimeDefinedParameterDictionary]::new()
    foreach ($PropertyItem in $Type.declaredproperties) {
        $attributes = [Collection[Attribute]]@()
        if ($PropertyItem.Name -in $MandatoryProperties) {
            $attributes.Add([ParameterAttribute]@{Mandatory=$true})
        } else {
            $attributes.Add([ParameterAttribute]@{})
        }

        #Convert Booleans to switches
        if ([String]$PropertyItem.PropertyType -match 'bool') {
            $PropertyType = [switch]
        } else {
            $PropertyType = $PropertyItem.PropertyType
        }

        $Param = [runtimedefinedparameter]::new(
            $PropertyItem.Name,         #string name
            $PropertyType,              #type ParameterType
            $attributes                 #System.Collections.ObjectModel.Collection[System.Attribute] attributes
        )
        $dynamicParams[$Param.Name] = $Param
    }
    return $dynamicParams
}