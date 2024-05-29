function Get-FalconHorizonGcpAccount {
<#
.SYNOPSIS
Search for Falcon Horizon GCP accounts
.DESCRIPTION
Requires 'CSPM registration: Read'.
.PARAMETER Id
GCP resource identifier
.PARAMETER ParentType
GCP hierarchy parent type
.PARAMETER ScanType
Scan type
.PARAMETER Status
Account status
.PARAMETER Sort
Property and direction to sort results
.PARAMETER Limit
Maximum number of results per request [default: 100]
.PARAMETER Offset
Position to begin retrieving results
.PARAMETER All
Repeat requests until all available results are retrieved
.PARAMETER Total
Display total result count instead of results
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Get-FalconHorizonGcpAccount
#>
  [CmdletBinding(DefaultParameterSetName='/cloud-connect-cspm-gcp/entities/account/v1:get',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/cloud-connect-cspm-gcp/entities/account/v1:get',Position=1)]
    [Alias('ids')]
    [string[]]$Id,
    [Parameter(ParameterSetName='/cloud-connect-cspm-gcp/entities/account/v1:get',Position=2)]
    [ValidateSet('Folder','Organization','Project',IgnoreCase=$false)]
    [Alias('parent_type')]
    [string]$ParentType,
    [Parameter(ParameterSetName='/cloud-connect-cspm-gcp/entities/account/v1:get',Position=3)]
    [ValidateSet('dry','full',IgnoreCase=$false)]
    [Alias('scan-type')]
    [string]$ScanType,
    [Parameter(ParameterSetName='/cloud-connect-cspm-gcp/entities/account/v1:get',Position=4)]
    [ValidateSet('operational','provisioned',IgnoreCase=$false)]
    [string]$Status,
    [Parameter(ParameterSetName='/cloud-connect-cspm-gcp/entities/account/v1:get',Position=5)]
    [string]$Sort,
    [Parameter(ParameterSetName='/cloud-connect-cspm-gcp/entities/account/v1:get',Position=6)]
    [int32]$Limit,
    [Parameter(ParameterSetName='/cloud-connect-cspm-gcp/entities/account/v1:get')]
    [int32]$Offset,
    [Parameter(ParameterSetName='/cloud-connect-cspm-gcp/entities/account/v1:get')]
    [switch]$All,
    [Parameter(ParameterSetName='/cloud-connect-cspm-gcp/entities/account/v1:get')]
    [switch]$Total
  )
  begin {
    $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }
    [System.Collections.Generic.List[string]]$List = @()
  }
  process {
    if ($Id) { @($Id).foreach{ $List.Add($_) } } else { Invoke-Falcon @Param -UserInput $PSBoundParameters }
  }
  end {
    if ($List) { $PSBoundParameters['Id'] = $List }
    Invoke-Falcon @Param -UserInput $PSBoundParameters
  }
}
function Remove-FalconHorizonGcpAccount {
<#
.SYNOPSIS
Remove Falcon Horizon GCP accounts
.DESCRIPTION
Requires 'CSPM registration: Write'.
.PARAMETER Id
GCP resource identifier
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Remove-FalconHorizonGcpAccount
#>
  [CmdletBinding(DefaultParameterSetName='/cloud-connect-cspm-gcp/entities/account/v1:delete',
    SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/cloud-connect-cspm-gcp/entities/account/v1:delete',
      ValueFromPipelineByPropertyName,ValueFromPipeline,Position=1)]
    [Alias('ids')]
    [string[]]$Id
  )
  begin {
    $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }
    [System.Collections.Generic.List[string]]$List = @()
  }
  process { if ($Id) { @($Id).foreach{ $List.Add($_) }}}
  end {
    if ($List) {
      $PSBoundParameters['Id'] = $List
      Invoke-Falcon @Param -UserInput $PSBoundParameters
    }
  }
}