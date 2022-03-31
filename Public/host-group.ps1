function Edit-FalconHostGroup {
<#
.SYNOPSIS
Modify a host group
.DESCRIPTION
Requires 'Host Groups: Write'.
.PARAMETER Name
Host group name
.PARAMETER Description
Host group description
.PARAMETER AssignmentRule
FQL-based assignment rule,used with dynamic host groups
.PARAMETER Id
Host group identifier
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Host-and-Host-Group-Management
#>
    [CmdletBinding(DefaultParameterSetName='/devices/entities/host-groups/v1:patch')]
    param(
        [Parameter(ParameterSetName='/devices/entities/host-groups/v1:patch',ValueFromPipelineByPropertyName,
            Position=1)]
        [string]$Name,

        [Parameter(ParameterSetName='/devices/entities/host-groups/v1:patch',ValueFromPipelineByPropertyName,
            Position=2)]
        [string]$Description,

        [Parameter(ParameterSetName='/devices/entities/host-groups/v1:patch',ValueFromPipelineByPropertyName,
            Position=3)]
        [Alias('assignment_rule')]
        [string]$AssignmentRule,

        [Parameter(ParameterSetName='/devices/entities/host-groups/v1:patch',Mandatory,
            ValueFromPipelineByPropertyName,Position=4)]
        [ValidatePattern('^\w{32}$')]
        [string]$Id
    )
    begin {
        $Param = @{
            Command = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Format = @{ Body = @{ resources = @('assignment_rule','id','name','description') }}
        }
    }
    process { Invoke-Falcon @Param -Inputs $PSBoundParameters }
}
function Get-FalconHostGroup {
<#
.SYNOPSIS
Search for host groups
.DESCRIPTION
Requires 'Host Groups: Read'.
.PARAMETER Id
Host group identifier
.PARAMETER Filter
Falcon Query Language expression to limit results
.PARAMETER Sort
Property and direction to sort results
.PARAMETER Limit
Maximum number of results per request
.PARAMETER Offset
Position to begin retrieving results
.PARAMETER Detailed
Retrieve detailed information
.PARAMETER All
Repeat requests until all available results are retrieved
.PARAMETER Total
Display total result count instead of results
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Host-and-Host-Group-Management
#>
    [CmdletBinding(DefaultParameterSetName='/devices/queries/host-groups/v1:get')]
    param(
        [Parameter(ParameterSetName='/devices/entities/host-groups/v1:get',Mandatory,ValueFromPipeline,
            ValueFromPipelineByPropertyName)]
        [ValidatePattern('^\w{32}$')]
        [Alias('ids')]
        [string[]]$Id,

        [Parameter(ParameterSetName='/devices/queries/host-groups/v1:get',Position=1)]
        [Parameter(ParameterSetName='/devices/combined/host-groups/v1:get',Position=1)]
        [ValidateScript({ Test-FqlStatement $_ })]
        [string]$Filter,

        [Parameter(ParameterSetName='/devices/queries/host-groups/v1:get',Position=2)]
        [Parameter(ParameterSetName='/devices/combined/host-groups/v1:get',Position=2)]
        [ValidateSet('created_by.asc','created_by.desc','created_timestamp.asc','created_timestamp.desc',
            'group_type.asc','group_type.desc','modified_by.asc','modified_by.desc','modified_timestamp.asc',
            'modified_timestamp.desc','name.asc','name.desc',IgnoreCase=$false)]
        [string]$Sort,

        [Parameter(ParameterSetName='/devices/queries/host-groups/v1:get',Position=3)]
        [Parameter(ParameterSetName='/devices/combined/host-groups/v1:get',Position=3)]
        [ValidateRange(1,500)]
        [int32]$Limit,

        [Parameter(ParameterSetName='/devices/queries/host-groups/v1:get')]
        [Parameter(ParameterSetName='/devices/combined/host-groups/v1:get')]
        [int32]$Offset,

        [Parameter(ParameterSetName='/devices/combined/host-groups/v1:get',Mandatory)]
        [switch]$Detailed,

        [Parameter(ParameterSetName='/devices/queries/host-groups/v1:get')]
        [Parameter(ParameterSetName='/devices/combined/host-groups/v1:get')]
        [switch]$All,

        [Parameter(ParameterSetName='/devices/queries/host-groups/v1:get')]
        [switch]$Total
    )
    begin {
        $Param = @{
            Command = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Format = @{ Query = @('ids','filter','sort','limit','offset') }
        }
        [System.Collections.ArrayList]$IdArray = @()
    }
    process {
        if ($Id) {
            @($Id).foreach{ [void]$IdArray.Add($_) }
        } else {
            Invoke-Falcon @Param -Inputs $PSBoundParameters
        }
    }
    end {
        if ($IdArray) {
            $PSBoundParameters['Id'] = @($IdArray | Select-Object -Unique)
            Invoke-Falcon @Param -Inputs $PSBoundParameters
        }
    }
}
function Get-FalconHostGroupMember {
<#
.SYNOPSIS
Search for host group members
.DESCRIPTION
Requires 'Host Groups: Read'.
.PARAMETER Id
Host group identifier
.PARAMETER Filter
Falcon Query Language expression to limit results
.PARAMETER Sort
Property and direction to sort results
.PARAMETER Limit
The maximum records to return
.PARAMETER Offset
The offset to start retrieving records from
.PARAMETER Detailed
Retrieve detailed information
.PARAMETER All
Repeat requests until all available results are retrieved
.PARAMETER Total
Display total result count instead of results
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Host-and-Host-Group-Management
#>
    [CmdletBinding(DefaultParameterSetName='/devices/queries/host-group-members/v1:get')]
    param(
        [Parameter(ParameterSetName='/devices/queries/host-group-members/v1:get',ValueFromPipeline,
            ValueFromPipelineByPropertyName,Position=1)]
        [Parameter(ParameterSetName='/devices/combined/host-group-members/v1:get',ValueFromPipeline,
            ValueFromPipelineByPropertyName,Position=1)]
        [ValidatePattern('^\w{32}$')]
        [string]$Id,

        [Parameter(ParameterSetName='/devices/queries/host-group-members/v1:get',Position=2)]
        [Parameter(ParameterSetName='/devices/combined/host-group-members/v1:get',Position=2)]
        [ValidateScript({ Test-FqlStatement $_ })]
        [string]$Filter,

        [Parameter(ParameterSetName='/devices/queries/host-group-members/v1:get',Position=3)]
        [Parameter(ParameterSetName='/devices/combined/host-group-members/v1:get',Position=3)]
        [string]$Sort,

        [Parameter(ParameterSetName='/devices/queries/host-group-members/v1:get',Position=4)]
        [Parameter(ParameterSetName='/devices/combined/host-group-members/v1:get',Position=4)]
        [ValidateRange(1,500)]
        [int32]$Limit,

        [Parameter(ParameterSetName='/devices/queries/host-group-members/v1:get',Position=5)]
        [Parameter(ParameterSetName='/devices/combined/host-group-members/v1:get',Position=5)]
        [int32]$Offset,

        [Parameter(ParameterSetName='/devices/combined/host-group-members/v1:get',Mandatory)]
        [switch]$Detailed,

        [Parameter(ParameterSetName='/devices/queries/host-group-members/v1:get')]
        [Parameter(ParameterSetName='/devices/combined/host-group-members/v1:get')]
        [switch]$All,

        [Parameter(ParameterSetName='/devices/queries/host-group-members/v1:get')]
        [switch]$Total
    )
    begin {
        $Param = @{
            Command = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Format = @{ Query = @('id','filter','sort','limit','offset') }
        }
    }
    process { Invoke-Falcon @Param -Inputs $PSBoundParameters }
}
function Invoke-FalconHostGroupAction {
<#
.SYNOPSIS
Perform actions on host groups
.DESCRIPTION
Requires 'Host Groups: Write'.

Adds or removes hosts from host groups in batches of 500.
.PARAMETER Name
Action to perform
.PARAMETER HostId
Host identifier
.PARAMETER Id
Host group identifier
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Host-and-Host-Group-Management
#>
    [CmdletBinding(DefaultParameterSetName='/devices/entities/host-group-actions/v1:post')]
    param(
        [Parameter(ParameterSetName='/devices/entities/host-group-actions/v1:post',Mandatory,Position=1)]
        [ValidateSet('add-hosts','remove-hosts',IgnoreCase=$false)]
        [Alias('action_name')]
        [string]$Name,

        [Parameter(ParameterSetName='/devices/entities/host-group-actions/v1:post',Mandatory,Position=3)]
        [ValidatePattern('^\w{32}$')]
        [Alias('ids','device_id','HostIds')]
        [string[]]$HostId,

        [Parameter(ParameterSetName='/devices/entities/host-group-actions/v1:post',Mandatory,ValueFromPipeline,
            ValueFromPipelineByPropertyName,Position=3)]
        [ValidatePattern('^\w{32}$')]
        [string]$Id
    )
    begin {
        $Param = @{
            Command = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Format = @{
                Query = @('action_name')
                Body = @{ root = @('ids','action_parameters') }
            }
        }
        [System.Collections.ArrayList]$IdArray = @()
    }
    process {
        if ($HostId) { @($HostId).foreach{ [void]$IdArray.Add($_) }}
    }
    end {
        if ($IdArray) {
            $PSBoundParameters['Ids'] = @($PSBoundParameters.Id)
            [void]$PSBoundParameters.Remove('HostId')
            for ($i = 0; $i -lt $IdArray.Count; $i += 500) {
                $IdString = (@($IdArray[$i..($i + 499)]).foreach{ "'$_'" }) -join ','
                $PSBoundParameters['action_parameters'] = @(
                    @{ name = 'filter'; value = "(device_id:[$IdString])" }
                )
                Invoke-Falcon @Param -Inputs $PSBoundParameters
            }
        }
    }
}
function New-FalconHostGroup {
<#
.SYNOPSIS
Create host groups
.DESCRIPTION
Requires 'Host Groups: Write'.
.PARAMETER Array
An array of host groups to create in a single request
.PARAMETER GroupType
Host group type
.PARAMETER Name
Host group name
.PARAMETER Description
Host group description
.PARAMETER AssignmentRule
Assignment rule for 'dynamic' host groups
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Host-and-Host-Group-Management
#>
    [CmdletBinding(DefaultParameterSetName='/devices/entities/host-groups/v1:post')]
    param(
        [Parameter(ParameterSetName='array',Mandatory)]
        [ValidateScript({
            foreach ($Object in $_) {
                $Param = @{
                    Object = $Object
                    Command = 'New-FalconHostGroup'
                    Endpoint = '/devices/entities/host-groups/v1:post'
                    Required = @('group_type','name')
                    Content = @('group_type')
                    Format = @{ group_type = 'GroupType' }
                }
                Confirm-Parameter @Param
                if ($Object.group_type -eq 'static' -and $Object.assignment_rule) {
                    $ObjectString = ConvertTo-Json -InputObject $Object -Compress
                    throw "'assignment_rule' can only be used with 'group_type = dynamic'. $ObjectString"
                }
            }
        })]
        [Alias('resources')]
        [array]$Array,

        [Parameter(ParameterSetName='/devices/entities/host-groups/v1:post',Mandatory,Position=1)]
        [ValidateSet('static','dynamic',IgnoreCase=$false)]
        [Alias('group_type')]
        [string]$GroupType,

        [Parameter(ParameterSetName='/devices/entities/host-groups/v1:post',Mandatory,Position=2)]
        [string]$Name,

        [Parameter(ParameterSetName='/devices/entities/host-groups/v1:post',Position=3)]
        [string]$Description,

        [Parameter(ParameterSetName='/devices/entities/host-groups/v1:post',Position=4)]
        [ValidateScript({
            if ($PSBoundParameters.GroupType -eq 'static') {
                throw "'AssignmentRule' can only be used with GroupType 'dynamic'."
            } else {
                $true
            }
        })]
        [Alias('assignment_rule')]
        [string]$AssignmentRule
    )
    begin {
        $Param = @{
            Command = $MyInvocation.MyCommand.Name
            Endpoint = '/devices/entities/host-groups/v1:post'
            Format = @{
                Body = @{
                    resources = @('name','description','group_type','assignment_rule')
                    root = @('resources')
                }
            }
        }
    }
    process { Invoke-Falcon @Param -Inputs $PSBoundParameters }
}
function Remove-FalconHostGroup {
<#
.SYNOPSIS
Remove host groups
.DESCRIPTION
Requires 'Host Groups: Write'.
.PARAMETER Id
Host group identifier
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Host-and-Host-Group-Management
#>
    [CmdletBinding(DefaultParameterSetName='/devices/entities/host-groups/v1:delete')]
    param(
        [Parameter(ParameterSetName='/devices/entities/host-groups/v1:delete',Mandatory,ValueFromPipeline,
            ValueFromPipelineByPropertyName,Position=1)]
        [ValidatePattern('^\w{32}$')]
        [Alias('ids')]
        [string[]]$Id
    )
    begin {
        $Param = @{
            Command = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Format = @{ Query = @('ids') }
        }
        [System.Collections.ArrayList]$IdArray = @()
    }
    process { if ($Id) { @($Id).foreach{ [void]$IdArray.Add($_) }}}
    end {
        if ($IdArray) {
            $PSBoundParameters['Id'] = @($IdArray | Select-Object -Unique)
            Invoke-Falcon @Param -Inputs $PSBoundParameters
        }
    }
}