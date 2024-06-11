function Edit-FalconIdentityEntity {
<#
.SYNOPSIS
Modify a Falcon Identity Protection entity
.DESCRIPTION
Requires 'Identity Protection Entities: Write'.
.PARAMETER Operation

.PARAMETER Classification

.PARAMETER AuthorizerId

.PARAMETER Id
Entity identifier
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Edit-FalconIdentityEntity
#>
  [CmdletBinding(DefaultParameterSetName='/idp-entities-explorer/entities/entities/v1:patch',
    SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/idp-entities-explorer/entities/entities/v1:patch',Mandatory,Position=1)]
    [string]$Operation,
    [Parameter(ParameterSetName='/idp-entities-explorer/entities/entities/v1:patch',Position=2)]
    [Alias('classifications')]
    [string[]]$Classification,
    [Parameter(ParameterSetName='/idp-entities-explorer/entities/entities/v1:patch',Position=3)]
    [Alias('authorizerEntityIds')]
    [string[]]$AuthorizerId,
    [Parameter(ParameterSetName='/idp-entities-explorer/entities/entities/v1:patch',
      ValueFromPipelineByPropertyName,ValueFromPipeline,Mandatory,Position=4)]
    [ValidatePattern('^[a-fA-F0-9]{8}-([a-fA-F0-9]{4}-){3}[a-fA-F0-9]{12}$')]
    [Alias('ids')]
    [string[]]$Id
  )
  begin {
    $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName; Max = 200 }
    [System.Collections.Generic.List[string]]$List = @()
  }
  process { if ($Id) { @($Id).foreach{ $List.Add($_) }}}
  end {
    if ($List) {
      $PSBoundParameters['Id'] = @($List)
      Invoke-Falcon @Param -UserInput $PSBoundParameters
    }
  }
}
function Get-FalconIdentityEntity {
<#
.SYNOPSIS
Search for Falcon Identity Protection entities
.DESCRIPTION
Requires 'Identity Protection Entities: Read'.
.PARAMETER Filter
Falcon Query Language expression to limit results
.PARAMETER Sort
Property and direction to sort results
.PARAMETER Limit
Maximum number of results per request [default: 100]
.PARAMETER Offset
Position to begin retrieving results
.PARAMETER Detailed
Retrieve detailed information
.PARAMETER All
Repeat requests until all available results are retrieved
.PARAMETER Total
Display total result count instead of results
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Get-FalconIdentityEntity
#>
  [CmdletBinding(DefaultParameterSetName='/idp-entities-explorer/queries/entities/v1:get',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/idp-entities-explorer/entities/entities/v1:post',ValueFromPipelineByPropertyName,
      ValueFromPipeline,Mandatory)]
    [ValidatePattern('^[a-fA-F0-9]{8}-([a-fA-F0-9]{4}-){3}[a-fA-F0-9]{12}$')]
    [Alias('ids')]
    [string[]]$Id,
    [Parameter(ParameterSetName='/idp-entities-explorer/queries/entities/v1:get',Position=1)]
    [ValidateScript({ Test-FqlStatement $_ })]
    [string]$Filter,
    [Parameter(ParameterSetName='/idp-entities-explorer/queries/entities/v1:get',Position=2)]
    [string]$Sort,
    [Parameter(ParameterSetName='/idp-entities-explorer/queries/entities/v1:get',Position=3)]
    [ValidateRange(1,200)]
    [int32]$Limit,
    [Parameter(ParameterSetName='/idp-entities-explorer/queries/entities/v1:get')]
    [int32]$Offset,
    [Parameter(ParameterSetName='/idp-entities-explorer/queries/entities/v1:get')]
    [switch]$Detailed,
    [Parameter(ParameterSetName='/idp-entities-explorer/queries/entities/v1:get')]
    [switch]$All,
    [Parameter(ParameterSetName='/idp-entities-explorer/queries/entities/v1:get')]
    [switch]$Total
  )
  begin {
    $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }
    [System.Collections.Generic.List[string]]$List = @()
  }
  process { if ($Id) { @($Id).foreach{ $List.Add($_) }}}
  end {
    if ($List) {
      $PSBoundParameters['Id'] = @($List)
      $Param['Max'] = 200
    }
    Invoke-Falcon @Param -UserInput $PSBoundParameters
  }
}