function Get-FalconChannelControl {
<#
.SYNOPSIS
List Falcon channel file update control settings
.DESCRIPTION
Requires 'Channel File Control Settings: Read'.
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Get-FalconChannelControl
#>
  [CmdletBinding(DefaultParameterSetName='/delivery-settings/entities/delivery-settings/v1:get',
    SupportsShouldProcess)]
  param()
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function Set-FalconChannelControl {
<#
.SYNOPSIS
Configure Falcon channel file update control settings
.DESCRIPTION
Requires 'Channel File Control Settings: Write'.
.PARAMETER Type
Channel file type
.PARAMETER Cadence
Channel file delivery cadence
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Set-FalconChannelControl
#>
  [CmdletBinding(DefaultParameterSetName='/delivery-settings/entities/delivery-settings/v1:post',
    SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/delivery-settings/entities/delivery-settings/v1:post',Mandatory,Position=1)]
    [ValidateSet('sensor_operations','rapid_response_content',IgnoreCase=$false)]
    [Alias('delivery_type')]
    [string]$Type,
    [Parameter(ParameterSetName='/delivery-settings/entities/delivery-settings/v1:post',Mandatory,Position=2)]
    [ValidateSet('early_access','general_availability','pause',IgnoreCase=$false)]
    [Alias('delivery_cadence')]
    [string]$Cadence
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}