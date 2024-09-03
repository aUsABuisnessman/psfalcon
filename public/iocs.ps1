function Edit-FalconIoc {
<#
.SYNOPSIS
Modify custom indicators
.DESCRIPTION
Requires 'IOC Manager APIs: Write'.
.PARAMETER InputObject
One or more indicators to modify in a single request
.PARAMETER Action
Action to perform when a host observes the indicator
.PARAMETER Platform
Operating system platform
.PARAMETER Source
Origination source
.PARAMETER Severity
Severity level
.PARAMETER Description
Indicator description
.PARAMETER Filename
Indicator filename, used with hash values
.PARAMETER Tag
Indicator tag
.PARAMETER MobileAction
Action to perform when a mobile device observes the indicator
.PARAMETER HostGroup
Host group identifier
.PARAMETER AppliedGlobally
Assign to all host groups
.PARAMETER Expiration
Expiration date. When an indicator expires, its action is set to 'no_action' but it remains in your indicator list.
.PARAMETER FromParent
Inheritance from parent CID
.PARAMETER Comment
Audit log comment
.PARAMETER Retrodetect
Generate retroactive detections for hosts that have observed the indicator
.PARAMETER IgnoreWarning
Ignore warnings and modify all indicators
.PARAMETER Id
Indicator identifier
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Edit-FalconIoc
#>
  [CmdletBinding(DefaultParameterSetName='/iocs/entities/indicators/v1:patch',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='Pipeline',Mandatory,ValueFromPipeline)]
    [ValidateScript({ Confirm-Parameter $_ 'Edit-FalconIoc' '/iocs/entities/indicators/v1:patch' })]
    [Alias('indicators','Array')]
    [object[]]$InputObject,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:patch',Position=1)]
    [string]$Action,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:patch',Position=2)]
    [Alias('Platforms')]
    [string[]]$Platform,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:patch',Position=3)]
    [ValidateRange(1,256)]
    [string]$Source,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:patch',Position=4)]
    [string]$Severity,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:patch',Position=5)]
    [string]$Description,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:patch',Position=6)]
    [Alias('metadata')]
    [string]$Filename,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:patch',Position=7)]
    [Alias('tags')]
    [string[]]$Tag,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:patch',Position=8)]
    [ValidateSet('no_action','allow','detect','prevent',IgnoreCase=$false)]
    [Alias('mobile_action')]
    [string]$MobileAction,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:patch',Position=9)]
    [ValidatePattern('^[a-fA-F0-9]{32}$')]
    [Alias('host_groups','HostGroups')]
    [string[]]$HostGroup,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:patch',Position=10)]
    [Alias('applied_globally')]
    [boolean]$AppliedGlobally,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:patch',Position=11)]
    [ValidatePattern('^(\d{4}-\d{2}-\d{2}|\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z)$')]
    [string]$Expiration,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:patch',Position=13)]
    [Alias('from_parent')]
    [boolean]$FromParent,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:patch',Position=12)]
    [Parameter(ParameterSetName='Pipeline',Position=2)]
    [string]$Comment,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:patch',Position=14)]
    [Parameter(ParameterSetName='Pipeline',Position=3)]
    [Alias('retrodetects')]
    [boolean]$Retrodetect,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:patch',Position=15)]
    [Parameter(ParameterSetName='Pipeline',Position=4)]
    [Alias('ignore_warnings','IgnoreWarnings')]
    [boolean]$IgnoreWarning,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:patch',Mandatory,Position=16)]
    [ValidatePattern('^[A-Fa-f0-9]{64}$')]
    [string]$Id
  )
  begin {
    $Param = @{
      Command = $MyInvocation.MyCommand.Name
      Endpoint = '/iocs/entities/indicators/v1:patch'
      Max = 2000
    }
    $Param['Format'] = Get-EndpointFormat $Param.Endpoint
    [System.Collections.Generic.List[object]]$List = @()
  }
  process {
    if ($InputObject) {
      @($InputObject).foreach{
        # Filter to defined 'indicators' properties and remove empty values
        $i = [PSCustomObject]$_ | Select-Object $Param.Format.Body.indicators
        Remove-EmptyValue $i comment,expiration,tag
        $List.Add($i)
      }
    } else {
      if ($PSBoundParameters.Filename) {
        $PSBoundParameters['metadata'] = @{ filename = $PSBoundParameters.Filename }
        [void]$PSBoundParameters.Remove('Filename')
      }
      Invoke-Falcon @Param -UserInput $PSBoundParameters
    }
  }
  end {
    if ($List) {
      [void]$PSBoundParameters.Remove('InputObject')
      $Param.Format.Body = @{ root = @('comment','indicators') }
      $PSBoundParameters['indicators'] = @($List)
      Invoke-Falcon @Param -UserInput $PSBoundParameters
    }
  }
}
function Get-FalconIoc {
<#
.SYNOPSIS
Search for custom indicators
.DESCRIPTION
Requires 'IOC Manager APIs: Read'.
.PARAMETER Id
Indicator identifier
.PARAMETER Filter
Falcon Query Language expression to limit results
.PARAMETER Sort
Property and direction to sort results
.PARAMETER Limit
Maximum number of results per request
.PARAMETER FromParent
Inheritance from parent CID
.PARAMETER Offset
Position to begin retrieving results
.PARAMETER After
Pagination token to retrieve the next set of results
.PARAMETER Detailed
Retrieve detailed information
.PARAMETER All
Repeat requests until all available results are retrieved
.PARAMETER Total
Display total result count instead of results
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Get-FalconIoc
#>
  [CmdletBinding(DefaultParameterSetName='/iocs/queries/indicators/v1:get',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:get',Mandatory,ValueFromPipelineByPropertyName,
      ValueFromPipeline)]
    [ValidatePattern('^[A-Fa-f0-9]{64}$')]
    [Alias('ids')]
    [string[]]$Id,
    [Parameter(ParameterSetName='/iocs/queries/indicators/v1:get',Position=1)]
    [Parameter(ParameterSetName='/iocs/combined/indicator/v1:get',Position=1)]
    [ValidateScript({ Test-FqlStatement $_ })]
    [string]$Filter,
    [Parameter(ParameterSetName='/iocs/queries/indicators/v1:get',Position=2)]
    [Parameter(ParameterSetName='/iocs/combined/indicator/v1:get',Position=2)]
    [ValidateSet('action.asc','action.desc','applied_globally.asc','applied_globally.desc',
      'metadata.av_hits.asc','metadata.av_hits.desc','metadata.company_name.raw.asc',
      'metadata.company_name.raw.desc','created_by.asc','created_by.desc','created_on.asc',
      'created_on.desc','expiration.asc','expiration.desc','expired.asc','expired.desc',
      'metadata.filename.raw.asc','metadata.filename.raw.desc','modified_by.asc','modified_by.desc',
      'modified_on.asc','modified_on.desc','metadata.original_filename.raw.asc',
      'metadata.original_filename.raw.desc','metadata.product_name.raw.asc',
      'metadata.product_name.raw.desc','metadata.product_version.asc','metadata.product_version.desc',
      'severity_number.asc','severity_number.desc','source.asc','source.desc','type.asc','type.desc',
      'value.asc','value.desc',IgnoreCase=$false)]
    [string]$Sort,
    [Parameter(ParameterSetName='/iocs/queries/indicators/v1:get',Position=3)]
    [Parameter(ParameterSetName='/iocs/combined/indicator/v1:get',Position=3)]
    [ValidateRange(1,2000)]
    [int32]$Limit,
    [Parameter(ParameterSetName='/iocs/combined/indicator/v1:get',Position=4)]
    [Alias('from_parent')]
    [boolean]$FromParent,
    [Parameter(ParameterSetName='/iocs/queries/indicators/v1:get')]
    [Parameter(ParameterSetName='/iocs/combined/indicator/v1:get')]
    [int32]$Offset,
    [Parameter(ParameterSetName='/iocs/queries/indicators/v1:get')]
    [Parameter(ParameterSetName='/iocs/combined/indicator/v1:get')]
    [string]$After,
    [Parameter(ParameterSetName='/iocs/combined/indicator/v1:get',Mandatory)]
    [switch]$Detailed,
    [Parameter(ParameterSetName='/iocs/queries/indicators/v1:get')]
    [Parameter(ParameterSetName='/iocs/combined/indicator/v1:get')]
    [switch]$All,
    [Parameter(ParameterSetName='/iocs/queries/indicators/v1:get')]
    [switch]$Total
  )
  begin {
    $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }
    [System.Collections.Generic.List[string]]$List = @()
  }
  process {
    if ($Id) { @($Id).foreach{ $List.Add($_) }} else { Invoke-Falcon @Param -UserInput $PSBoundParameters }
  }
  end {
    if ($List) {
      $PSBoundParameters['Id'] = @($List)
      Invoke-Falcon @Param -UserInput $PSBoundParameters
    }
  }
}
function Get-FalconIocAction {
<#
.SYNOPSIS
Search for custom indicator actions
.DESCRIPTION
Requires 'IOC Manager APIs: Read'.
.PARAMETER Id
Custom indicator action identifier
.PARAMETER Limit
Maximum number of results per request
.PARAMETER Offset
Position to begin retrieving results
.PARAMETER Detailed
Retrieve detailed information
.PARAMETER All
Repeat requests until all available results are retrieved
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Get-FalconIocAction
#>
  [CmdletBinding(DefaultParameterSetName='/iocs/queries/actions/v1:get',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/iocs/entities/actions/v1:get',Mandatory,ValueFromPipelineByPropertyName,
      ValueFromPipeline,Position=1)]
    [Alias('ids')]
    [string[]]$Id,
    [Parameter(ParameterSetName='/iocs/queries/actions/v1:get',Position=1)]
    [int32]$Limit,
    [Parameter(ParameterSetName='/iocs/queries/actions/v1:get')]
    [int32]$Offset,
    [Parameter(ParameterSetName='/iocs/queries/actions/v1:get')]
    [switch]$Detailed,
    [Parameter(ParameterSetName='/iocs/queries/actions/v1:get')]
    [switch]$All
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function Get-FalconIocPlatform {
<#
.SYNOPSIS
List custom indicator platforms
.DESCRIPTION
Requires 'IOC Manager APIs: Read'.
.PARAMETER Limit
Maximum number of results per request
.PARAMETER Offset
Position to begin retrieving results
.PARAMETER All
Repeat requests until all available results are retrieved
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Get-FalconIocPlatform
#>
  [CmdletBinding(DefaultParameterSetName='/iocs/queries/platforms/v1:get',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/iocs/queries/platforms/v1:get',Position=1)]
    [int32]$Limit,
    [Parameter(ParameterSetName='/iocs/queries/platforms/v1:get')]
    [int32]$Offset,
    [Parameter(ParameterSetName='/iocs/queries/platforms/v1:get')]
    [switch]$All
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function Get-FalconIocSeverity {
<#
.SYNOPSIS
List custom indicator severities
.DESCRIPTION
Requires 'IOC Manager APIs: Read'.
.PARAMETER Limit
Maximum number of results per request
.PARAMETER Offset
Position to begin retrieving results
.PARAMETER All
Repeat requests until all available results are retrieved
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Get-FalconIocSeverity
#>
  [CmdletBinding(DefaultParameterSetName='/iocs/queries/severities/v1:get',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/iocs/queries/severities/v1:get',Position=1)]
    [int32]$Limit,
    [Parameter(ParameterSetName='/iocs/queries/severities/v1:get')]
    [int32]$Offset,
    [Parameter(ParameterSetName='/iocs/queries/severities/v1:get')]
    [switch]$All
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function Get-FalconIocType {
<#
.SYNOPSIS
List custom indicator types
.DESCRIPTION
Requires 'IOC Manager APIs: Read'.
.PARAMETER Limit
Maximum number of results per request
.PARAMETER Offset
Position to begin retrieving results
.PARAMETER All
Repeat requests until all available results are retrieved
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Get-FalconIocType
#>
  [CmdletBinding(DefaultParameterSetName='/iocs/queries/ioc-types/v1:get',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/iocs/queries/ioc-types/v1:get',Position=1)]
    [int32]$Limit,
    [Parameter(ParameterSetName='/iocs/queries/ioc-types/v1:get')]
    [int32]$Offset,
    [Parameter(ParameterSetName='/iocs/queries/ioc-types/v1:get')]
    [switch]$All
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function New-FalconIoc {
<#
.SYNOPSIS
Create custom indicators
.DESCRIPTION
Requires 'IOC Manager APIs: Write'.
.PARAMETER InputObject
One or more indicators to create in a single request
.PARAMETER Type
Indicator type
.PARAMETER Value
String representation of the indicator
.PARAMETER Action
Action to perform when a host observes the indicator
.PARAMETER Platform
Operating system platform
.PARAMETER Source
Origination source
.PARAMETER Severity
Severity level
.PARAMETER Description
Indicator description
.PARAMETER Filename
Indicator filename,used with hash values
.PARAMETER Tag
Indicator tag
.PARAMETER MobileAction
Action to perform when a mobile device observes the indicator
.PARAMETER HostGroup
Host group identifier
.PARAMETER AppliedGlobally
Assign to all host groups
.PARAMETER Expiration
Expiration date. When an indicator expires,its action is set to 'no_action' but it remains in your indicator list.
.PARAMETER Comment
Audit log comment
.PARAMETER Retrodetect
Generate retroactive detections for hosts that have observed the indicator
.PARAMETER IgnoreWarning
Ignore warnings and create all indicators
.LINK
https://github.com/crowdstrike/psfalcon/wiki/New-FalconIoc
#>
  [CmdletBinding(DefaultParameterSetName='/iocs/entities/indicators/v1:post',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='Pipeline',Mandatory,ValueFromPipeline)]
    [ValidateScript({ Confirm-Parameter $_ 'New-FalconIoc' '/iocs/entities/indicators/v1:post' })]
    [Alias('indicators','Array')]
    [object[]]$InputObject,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:post',Mandatory,Position=1)]
    [string]$Action,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:post',Mandatory,Position=2)]
    [Alias('platforms')]
    [string[]]$Platform,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:post',Position=3)]
    [ValidateRange(1,256)]
    [string]$Source,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:post',Position=4)]
    [string]$Severity,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:post',Position=5)]
    [string]$Description,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:post',Position=6)]
    [Alias('metadata')]
    [string]$Filename,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:post',Position=7)]
    [Alias('tags')]
    [string[]]$Tag,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:post',Position=8)]
    [ValidateSet('no_action','allow','detect','prevent',IgnoreCase=$false)]
    [Alias('mobile_action')]
    [string]$MobileAction,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:post',Position=9)]
    [ValidatePattern('^[a-fA-F0-9]{32}$')]
    [Alias('host_groups','HostGroups')]
    [string[]]$HostGroup,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:post',Position=10)]
    [Alias('applied_globally')]
    [boolean]$AppliedGlobally,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:post',Position=11)]
    [ValidatePattern('^(\d{4}-\d{2}-\d{2}|\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z)$')]
    [string]$Expiration,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:post',Position=12)]
    [Parameter(ParameterSetName='Pipeline',Position=2)]
    [string]$Comment,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:post',Position=13)]
    [Parameter(ParameterSetName='Pipeline',Position=3)]
    [Alias('Retrodetects')]
    [boolean]$Retrodetect,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:post',Position=14)]
    [Parameter(ParameterSetName='Pipeline',Position=4)]
    [Alias('ignore_warnings','IgnoreWarnings')]
    [boolean]$IgnoreWarning,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:post',Mandatory,Position=15)]
    [string]$Type,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:post',Mandatory,Position=16)]
    [string]$Value
  )
  begin {
    $Param = @{
      Command = $MyInvocation.MyCommand.Name
      Endpoint = '/iocs/entities/indicators/v1:post'
      Max = 2000
    }
    $Param['Format'] = Get-EndpointFormat $Param.Endpoint
    [System.Collections.Generic.List[object]]$List = @()
  }
  process {
    if ($InputObject) {
      @($InputObject).foreach{
        # Filter to defined 'indicators' properties and remove empty values
        $i = [PSCustomObject]$_ | Select-Object $Param.Format.Body.indicators
        Remove-EmptyValue $i comment,expiration,tag
        $List.Add($i)
      }
    } elseif (!$PSBoundParameters.HostGroup -and !$PSBoundParameters.AppliedGlobally) {
      throw "'HostGroup' or 'AppliedGlobally' must be provided."
    } else {
      if ($PSBoundParameters.Filename) {
        $PSBoundParameters['metadata'] = @{ filename = $PSBoundParameters.Filename }
        [void]$PSBoundParameters.Remove('Filename')
      }
      Invoke-Falcon @Param -UserInput $PSBoundParameters
    }
  }
  end {
    if ($List) {
      [void]$PSBoundParameters.Remove('InputObject')
      $Param.Format.Body = @{ root = @('comment','indicators') }
      $PSBoundParameters['indicators'] = @($List)
      Invoke-Falcon @Param -UserInput $PSBoundParameters
    }
  }
}
function Remove-FalconIoc {
<#
.SYNOPSIS
Remove custom indicators
.DESCRIPTION
Requires 'IOC Manager APIs: Write'.
.PARAMETER Filter
Falcon Query Language expression to find indicators for removal
.PARAMETER Comment
Audit log comment
.PARAMETER FromParent
Inheritance from parent CID
.PARAMETER Id
Indicator identifier
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Remove-FalconIoc
#>
  [CmdletBinding(DefaultParameterSetName='/iocs/entities/indicators/v1:delete',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='Filter',Mandatory)]
    [ValidateScript({ Test-FqlStatement $_ })]
    [string]$Filter,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:delete',Position=1)]
    [Parameter(ParameterSetName='Filter',Position=2)]
    [string]$Comment,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:delete',Position=2)]
    [Parameter(ParameterSetName='Filter',Position=3)]
    [Alias('from_parent')]
    [boolean]$FromParent,
    [Parameter(ParameterSetName='/iocs/entities/indicators/v1:delete',ValueFromPipelineByPropertyName,
      ValueFromPipeline,Position=2)]
    [ValidatePattern('^[A-Fa-f0-9]{64}$')]
    [Alias('ids')]
    [string[]]$Id
  )
  begin {
    $Param = @{
      Command = $MyInvocation.MyCommand.Name
      Endpoint = '/iocs/entities/indicators/v1:delete'
      Format = @{ Query = @('ids','filter','comment','from_parent') }
    }
    [System.Collections.Generic.List[string]]$List = @()
  }
  process {
    if ($Id) {
      @($Id).foreach{ $List.Add($_) }
    } elseif ($Filter) {
      Invoke-Falcon @Param -UserInput $PSBoundParameters
    }
  }
  end {
    if (!$Id -and !$Filter) {
      throw "'Filter' or 'Id' must be provided."
    } elseif ($List) {
      $PSBoundParameters['Id'] = @($List)
      Invoke-Falcon @Param -UserInput $PSBoundParameters
    }
  }
}
Register-ArgumentCompleter -CommandName New-FalconIoc -ParameterName Type -ScriptBlock {Get-FalconIocType -EA 0}
@('Edit-FalconIoc','New-FalconIoc').foreach{
  Register-ArgumentCompleter -CommandName $_ -ParameterName Action -ScriptBlock {Get-FalconIocAction -EA 0}
  Register-ArgumentCompleter -CommandName $_ -ParameterName Platform -ScriptBlock {Get-FalconIocPlatform -EA 0}
  Register-ArgumentCompleter -CommandName $_ -ParameterName Severity -ScriptBlock {Get-FalconIocSeverity -EA 0}
}