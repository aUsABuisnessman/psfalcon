function New-CommandName {
<#
.SYNOPSIS
Returns external assets aggregates.
.DESCRIPTION
Requires 'Falcon Discover: Read'.
.PARAMETER From

.PARAMETER To

.PARAMETER Exclude

.PARAMETER Field

.PARAMETER Filter
Falcon Query Language expression to limit results
.PARAMETER From

.PARAMETER Include

.PARAMETER Interval

.PARAMETER MaxDocCount

.PARAMETER MinDocCount

.PARAMETER Missing

.PARAMETER Name

.PARAMETER Query
Perform a generic substring search across available fields
.PARAMETER From

.PARAMETER To

.PARAMETER Size

.PARAMETER Sort
Property and direction to sort results
.PARAMETER DateRanges

.PARAMETER Exclude

.PARAMETER Field

.PARAMETER Filter
Falcon Query Language expression to limit results
.PARAMETER From

.PARAMETER Include

.PARAMETER Interval

.PARAMETER MaxDocCount

.PARAMETER MinDocCount

.PARAMETER Missing

.PARAMETER Name

.PARAMETER Query
Perform a generic substring search across available fields
.PARAMETER Ranges

.PARAMETER Size

.PARAMETER Sort
Property and direction to sort results
.PARAMETER SubAggregates

.PARAMETER TimeZone

.PARAMETER Type

.PARAMETER TimeZone

.PARAMETER Type

.LINK
https://github.com/crowdstrike/psfalcon/wiki/New-CommandName
#>
  [CmdletBinding(DefaultParameterSetName='/fem/aggregates/external-assets/v1:post',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$From,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$To,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Exclude,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Field,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Filter,
    [ValidateScript({ Test-FqlStatement $_ })]
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [int32]$From,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Include,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Interval,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Position=0)]
    [Alias('max_doc_count')]
    [int64]$MaxDocCount,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Position=0)]
    [Alias('min_doc_count')]
    [int64]$MinDocCount,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Missing,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Name,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Position=0)]
    [Alias('q')]
    [string]$Query,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [double]$From,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [double]$To,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [int32]$Size,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Sort,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Position=0)]
    [Alias('date_ranges')]
    [msa.DateRangeSpec]$DateRanges,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Exclude,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Field,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Filter,
    [ValidateScript({ Test-FqlStatement $_ })]
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [int32]$From,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Include,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Interval,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Position=0)]
    [Alias('max_doc_count')]
    [int64]$MaxDocCount,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Position=0)]
    [Alias('min_doc_count')]
    [int64]$MinDocCount,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Missing,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Name,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Position=0)]
    [Alias('q')]
    [string]$Query,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [msa.RangeSpec]$Ranges,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [int32]$Size,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Sort,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Position=0)]
    [Alias('sub_aggregates')]
    [msa.AggregateQueryRequest]$SubAggregates,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Position=0)]
    [Alias('time_zone')]
    [string]$TimeZone,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Type,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Position=0)]
    [Alias('time_zone')]
    [string]$TimeZone,
    [Parameter(ParameterSetName='/fem/aggregates/external-assets/v1:post',Mandatory,Position=0)]
    [string]$Type
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function New-CommandName {
<#
.SYNOPSIS
Download the entire contents of the blob. The relative link to this endpoint is returned in the GET /entities/external-assets/v1 request.
.DESCRIPTION
Requires 'Falcon Discover: Read'.
.PARAMETER Assetid
The Asset ID
.PARAMETER Hash
The File Hash
.LINK
https://github.com/crowdstrike/psfalcon/wiki/New-CommandName
#>
  [CmdletBinding(DefaultParameterSetName='/fem/entities/blobs-download/v1:get',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/fem/entities/blobs-download/v1:get',Mandatory,Position=0)]
    [string]$Assetid,
    [Parameter(ParameterSetName='/fem/entities/blobs-download/v1:get',Mandatory,Position=0)]
    [string]$Hash
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function New-CommandName {
<#
.SYNOPSIS
Download a preview of the blob. The relative link to this endpoint is returned in the GET /entities/external-assets/v1 request.
.DESCRIPTION
Requires 'Falcon Discover: Read'.
.PARAMETER Assetid
The Asset ID
.PARAMETER Hash
The File Hash
.LINK
https://github.com/crowdstrike/psfalcon/wiki/New-CommandName
#>
  [CmdletBinding(DefaultParameterSetName='/fem/entities/blobs-preview/v1:get',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/fem/entities/blobs-preview/v1:get',Mandatory,Position=0)]
    [string]$Assetid,
    [Parameter(ParameterSetName='/fem/entities/blobs-preview/v1:get',Mandatory,Position=0)]
    [string]$Hash
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function New-CommandName {
<#
.SYNOPSIS
Get details on external assets by providing one or more IDs.
.DESCRIPTION
Requires 'Falcon Discover: Read'.
.PARAMETER Id
XXX identifier

One or more asset IDs (max: 100). Find asset IDs with GET `/fem/queries/external-assets/v1`
.LINK
https://github.com/crowdstrike/psfalcon/wiki/New-CommandName
#>
  [CmdletBinding(DefaultParameterSetName='/fem/entities/external-assets/v1:get',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/fem/entities/external-assets/v1:get',Mandatory,ValueFromPipelineByPropertyName,ValueFromPipeline)]
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
      $PSBoundParameters['Id'] = @($List | Select-Object -Unique)
      Invoke-Falcon @Param -UserInput $PSBoundParameters
    }
  }
}
function New-CommandName {
<#
.SYNOPSIS
Update the details of external assets.
.DESCRIPTION
Requires 'Falcon Discover: Write'.
.PARAMETER Cid
The asset's customer ID.
.PARAMETER Criticality
The criticality level manually assigned to this asset.
.PARAMETER CriticalityDescription
The criticality description manually assigned to this asset.
.PARAMETER Id
XXX identifier

The unique ID of the asset.
.PARAMETER Triage
The patch object definition to be applied to the asset
.LINK
https://github.com/crowdstrike/psfalcon/wiki/New-CommandName
#>
  [CmdletBinding(DefaultParameterSetName='/fem/entities/external-assets/v1:patch',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/fem/entities/external-assets/v1:patch',Position=0)]
    [string]$Cid,
    [Parameter(ParameterSetName='/fem/entities/external-assets/v1:patch',Position=0)]
    [string]$Criticality,
    [Parameter(ParameterSetName='/fem/entities/external-assets/v1:patch',Position=0)]
    [Alias('criticality_description')]
    [string]$CriticalityDescription,
    [Parameter(ParameterSetName='/fem/entities/external-assets/v1:patch',Mandatory,ValueFromPipelineByPropertyName,ValueFromPipeline)]
    [string]$Id,
    [Parameter(ParameterSetName='/fem/entities/external-assets/v1:patch',Position=0)]
    [object]$Triage
  )
  begin {
    $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }
    [System.Collections.Generic.List[string]]$List = @()
  }
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function New-CommandName {
<#
.SYNOPSIS
Get a list of external asset IDs that match the provided filter conditions. Use these IDs with the /entities/external-assets/v1 endpoints
.DESCRIPTION
Requires 'Falcon Discover: Read'.
.PARAMETER Offset
Position to begin retrieving results

Starting index of result set from which to return IDs.
.PARAMETER Limit
Maximum number of results per request

Number of IDs to return.
.PARAMETER Sort
Property and direction to sort results

Order by fields.
.PARAMETER Filter
Falcon Query Language expression to limit results

Filter assets using an FQL query. Common filter options include:<ul><li>asset_type:'ip'</li><li>last_seen_timestamp:>'now-7d'</li></ul>
			</br>Available filter fields that support exact match: asset_id, asset_type, confidence, connectivity_status, criticality, criticality_description, criticality_timestamp, criticality_username, data_providers, discovered_by, dns_domain.fqdn, dns_domain.isps, dns_domain.parent_domain, dns_domain.resolved_ips, dns_domain.services.applications.category, dns_domain.services.applications.cpe, dns_domain.services.applications.name, dns_domain.services.applications.vendor, dns_domain.services.applications.version, dns_domain.services.cloud_provider, dns_domain.services.cpes, dns_domain.services.hosting_provider, dns_domain.services.last_seen, dns_domain.services.platform_name, dns_domain.services.port, dns_domain.services.protocol, dns_domain.services.protocol_port, dns_domain.services.status, dns_domain.services.status_code, dns_domain.services.transport, dns_domain.type, first_seen, id, internet_exposure, ip.asn, ip.cloud_vm.description, ip.cloud_vm.instance_id, ip.cloud_vm.lifecycle, ip.cloud_vm.mac_address, ip.cloud_vm.owner_id, ip.cloud_vm.platform, ip.cloud_vm.private_ip, ip.cloud_vm.public_ip, ip.cloud_vm.region, ip.cloud_vm.security_groups, ip.cloud_vm.source, ip.cloud_vm.status, ip.fqdns, ip.ip_address, ip.isp, ip.location.area_code, ip.location.city, ip.location.country_code, ip.location.country_name, ip.location.postal_code, ip.location.region_code, ip.location.region_name, ip.location.timezone, ip.ptr, ip.aid, ip.services.applications.category, ip.services.applications.cpe, ip.services.applications.name, ip.services.applications.vendor, ip.services.applications.version, ip.services.cloud_provider, ip.services.cpes, ip.services.first_seen, ip.services.last_seen, ip.services.platform_name, ip.services.port, ip.services.protocol, ip.services.protocol_port, ip.services.status, ip.services.status_code, ip.services.transport, last_seen, manual, perimeter, subsidiaries.id, subsidiaries.name, triage.action, triage.assigned_to, triage.description, triage.status, triage.updated_by, triage.updated_timestamp
			</br>Available filter fields that supports wildcard (*): asset_id, asset_type, confidence, connectivity_status, criticality, criticality_username, data_providers, discovered_by, dns_domain.fqdn, dns_domain.isps, dns_domain.parent_domain, dns_domain.resolved_ips, dns_domain.services.applications.category, dns_domain.services.applications.cpe, dns_domain.services.applications.name, dns_domain.services.applications.vendor, dns_domain.services.applications.version, dns_domain.services.cloud_provider, dns_domain.services.cpes, dns_domain.services.hosting_provider, dns_domain.services.id, dns_domain.services.platform_name, dns_domain.services.port, dns_domain.services.protocol, dns_domain.services.protocol_port, dns_domain.services.status, dns_domain.services.status_code, dns_domain.services.transport, dns_domain.type, id, internet_exposure, ip.asn, ip.cloud_vm.instance_id, ip.cloud_vm.lifecycle, ip.cloud_vm.mac_address, ip.cloud_vm.owner_id, ip.cloud_vm.platform, ip.cloud_vm.private_ip, ip.cloud_vm.public_ip, ip.cloud_vm.region, ip.cloud_vm.security_groups, ip.cloud_vm.source, ip.cloud_vm.status, ip.fqdns, ip.ip_address, ip.isp, ip.location.area_code, ip.location.city, ip.location.country_code, ip.location.country_name, ip.location.postal_code, ip.location.region_code, ip.location.region_name, ip.location.timezone, ip.ptr, ip.aid, ip.services.applications.category, ip.services.applications.cpe, ip.services.applications.name, ip.services.applications.vendor, ip.services.applications.version, ip.services.cloud_provider, ip.services.cpes, ip.services.platform_name, ip.services.port, ip.services.protocol, ip.services.protocol_port, ip.services.status, ip.services.status_code, ip.services.transport, manual, perimeter, subsidiaries.id, subsidiaries.name, triage.action, triage.assigned_to, triage.description, triage.status, triage.updated_by
			</br>Available filter fields that supports in ([v1, v2]): asset_id, asset_type, confidence, connectivity_status, criticality, criticality_username, data_providers, discovered_by, dns_domain.fqdn, dns_domain.isps, dns_domain.parent_domain, dns_domain.services.applications.category, dns_domain.services.applications.cpe, dns_domain.services.applications.name, dns_domain.services.applications.vendor, dns_domain.services.applications.version, dns_domain.services.cloud_provider, dns_domain.services.cpes, dns_domain.services.id, dns_domain.services.platform_name, dns_domain.services.port, dns_domain.services.protocol, dns_domain.services.protocol_port, dns_domain.services.status, dns_domain.services.status_code, dns_domain.services.transport, dns_domain.type, id, internet_exposure, ip.asn, ip.cloud_vm.instance_id, ip.cloud_vm.lifecycle, ip.cloud_vm.mac_address, ip.cloud_vm.owner_id, ip.cloud_vm.platform, ip.cloud_vm.region, ip.cloud_vm.security_groups, ip.cloud_vm.source, ip.cloud_vm.status, ip.fqdns, ip.isp, ip.location.area_code, ip.location.city, ip.location.country_code, ip.location.country_name, ip.location.postal_code, ip.location.region_code, ip.location.region_name, ip.location.timezone, ip.ptr, ip.aid, ip.services.applications.category, ip.services.applications.cpe, ip.services.applications.name, ip.services.applications.vendor, ip.services.applications.version, ip.services.cloud_provider, ip.services.cpes, ip.services.platform_name, ip.services.port, ip.services.protocol, ip.services.protocol_port, ip.services.status, ip.services.status_code, ip.services.transport, manual, perimeter, subsidiaries.id, subsidiaries.name, triage.action, triage.assigned_to, triage.description, triage.status, triage.updated_by
			</br>Available filter fields that supports range comparisons (>, <, >=, <=): criticality_timestamp, dns_domain.resolved_ips, dns_domain.services.first_seen, dns_domain.services.last_seen, dns_domain.services.port, dns_domain.services.status_code, first_seen, ip.cloud_vm.private_ip, ip.cloud_vm.public_ip, ip.ip_address, ip.services.first_seen, ip.services.last_seen, ip.services.port, ip.services.status_code, last_seen, triage.updated_timestamp
			</br>All filter fields and operations supports negation (!).
.LINK
https://github.com/crowdstrike/psfalcon/wiki/New-CommandName
#>
  [CmdletBinding(DefaultParameterSetName='/fem/queries/external-assets/v1:get',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/fem/queries/external-assets/v1:get')]
    [string]$Offset,
    [Parameter(ParameterSetName='/fem/queries/external-assets/v1:get',Position=0)]
    [int32]$Limit,
    [Parameter(ParameterSetName='/fem/queries/external-assets/v1:get',Position=0)]
    [string]$Sort,
    [Parameter(ParameterSetName='/fem/queries/external-assets/v1:get',Position=0)]
    [string]$Filter,
    [ValidateScript({ Test-FqlStatement $_ })]
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
