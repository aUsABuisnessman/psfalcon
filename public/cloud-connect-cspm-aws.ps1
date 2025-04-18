function Edit-FalconCloudAwsAccount {
<#
.SYNOPSIS
Modify a Falcon Cloud Security AWS account
.DESCRIPTION
Requires 'CSPM registration: Write'.
.PARAMETER AccountId
AWS account identifier
.PARAMETER CloudtrailRegion
AWS region where the account resides
.PARAMETER IamRoleArn
AWS IAM role ARNs
.PARAMETER BehaviorAssessmentEnabled
Enable behavior assessment for account
.PARAMETER SensorManagementEnabled
Enable sensor management for account
.PARAMETER RemediationRegion
Region where remediation occurs
.PARAMETER RemediationTouAccepted
Remediation terms-of-use acceptance date
.PARAMETER Environment
Environment
.PARAMETER TargetOu
Target OU
.PARAMETER DspmEnabled
DSPM enabled
.PARAMETER DspmRole
DSPM role ARN
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Edit-FalconCloudAwsAccount
#>
  [CmdletBinding(DefaultParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:patch',
    SupportsShouldProcess)]
  [Alias('Edit-FalconHorizonAwsAccount')]
  param(
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:patch',Mandatory,
      ValueFromPipelineByPropertyName,Position=1)]
    [ValidatePattern('^\d{12}$')]
    [Alias('account_id','id')]
    [string]$AccountId,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:patch',
      ValueFromPipelineByPropertyName,Position=2)]
    [Alias('cloudtrail_region')]
    [string]$CloudtrailRegion,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:patch',
      ValueFromPipelineByPropertyName,Position=3)]
    [Alias('iam_role_arn')]
    [string]$IamRoleArn,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:patch',
      ValueFromPipelineByPropertyName,Position=4)]
    [Alias('behavior_assessment_enabled')]
    [boolean]$BehaviorAssessmentEnabled,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:patch',
      ValueFromPipelineByPropertyName,Position=5)]
    [Alias('sensor_management_enabled')]
    [boolean]$SensorManagementEnabled,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:patch',
      ValueFromPipelineByPropertyName,Position=6)]
    [Alias('remediation_region')]
    [string]$RemediationRegion,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:patch',
      ValueFromPipelineByPropertyName,Position=7)]
    [Alias('remediation_tou_accepted')]
    [string]$RemediationTouAccepted,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:patch',
      ValueFromPipelineByPropertyName,Position=8)]
    [string]$Environment,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:patch',
      ValueFromPipelineByPropertyName,Position=10)]
    [Alias('target_ous')]
    [string[]]$TargetOu,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:patch',
      ValueFromPipelineByPropertyName,Position=11)]
    [Alias('dspm_enabled')]
    [boolean]$DspmEnabled,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:patch',
      ValueFromPipelineByPropertyName,Position=12)]
    [Alias('dspm_role')]
    [string]$DspmRole
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function Get-FalconCloudAwsAccount {
<#
.SYNOPSIS
Search for Falcon Cloud Security AWS accounts
.DESCRIPTION
A properly provisioned AWS account will display the status 'Event_DiscoverAccountStatusOperational'.

Requires 'CSPM registration: Read'.
.PARAMETER Id
AWS account identifier
.PARAMETER OrganizationId
AWS organization identifier
.PARAMETER ScanType
Scan type
.PARAMETER Status
AWS account status
.PARAMETER GroupBy
Field to group by
.PARAMETER IamRoleArn
AWS IAM role ARNs
.PARAMETER Migrated
Only return migrated Discover for Cloud accounts
.PARAMETER CspmLite
Only return CSPM Lite accounts
.PARAMETER Limit
Maximum number of results per request
.PARAMETER Offset
Position to begin retrieving results
.PARAMETER All
Repeat requests until all available results are retrieved
.PARAMETER Total
Display total result count instead of results
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Get-FalconCloudAwsAccount
#>
  [CmdletBinding(DefaultParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:get',SupportsShouldProcess)]
  [Alias('Get-FalconHorizonAwsAccount')]
  param(
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:get',ValueFromPipelineByPropertyName,
      ValueFromPipeline)]
    [ValidatePattern('^\d{12}$')]
    [Alias('ids')]
    [string[]]$Id,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:get',Position=1)]
    [ValidatePattern('^o-[0-9a-z]{10,32}$')]
    [Alias('organization-ids','OrganizationIds')]
    [string[]]$OrganizationId,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:get',Position=2)]
    [ValidateSet('full','dry',IgnoreCase=$false)]
    [Alias('scan-type')]
    [string]$ScanType,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:get',Position=3)]
    [ValidateSet('provisioned','operational',IgnoreCase=$false)]
    [string]$Status,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:get',Position=4)]
    [ValidateSet('organization',IgnoreCase=$false)]
    [Alias('group_by')]
    [string]$GroupBy,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:get',Position=5)]
    [Alias('iam_role_arns')]
    [string[]]$IamRoleArn,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:get',Position=6)]
    [boolean]$Migrated,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:get',Position=7)]
    [Alias('cspm_lite')]
    [boolean]$CspmLite,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:get',Position=8)]
    [ValidateRange(1,500)]
    [int32]$Limit,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:get')]
    [int32]$Offset,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:get')]
    [switch]$All,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:get')]
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
function Get-FalconCloudAwsLink {
<#
.SYNOPSIS
Retrieve a URL to grant Falcon Cloud Security access in AWS
.DESCRIPTION
Once logging in to the provided link using your AWS administrator credentials, use the 'Create Stack' button to
grant access.

Requires 'CSPM registration: Read'.
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Get-FalconCloudAwsLink
#>
  [CmdletBinding(DefaultParameterSetName='/cloud-connect-cspm-aws/entities/console-setup-urls/v1:get',
    SupportsShouldProcess)]
  [Alias('Get-FalconHorizonAwsLink')]
  param()
  process { Invoke-Falcon -Command $MyInvocation.MyCommand.Name -Endpoint $PSCmdlet.ParameterSetName }
}
function New-FalconCloudAwsAccount {
<#
.SYNOPSIS
Provision a Falcon Cloud Security AWS account
.DESCRIPTION
Requires 'CSPM registration: Write'.
.PARAMETER AccountId
AWS account identifier
.PARAMETER CloudtrailRegion
AWS region where the account resides
.PARAMETER OrganizationId
AWS organization identifier
.PARAMETER AccountType
AWS account type
.PARAMETER IsMaster
Master account
.PARAMETER IamRoleArn
AWS IAM role ARNs
.PARAMETER UseExistingCloudtrail
Use existing Cloudtrail log
.PARAMETER BehaviorAssessmentEnabled
Enable behavior assessment for account
.PARAMETER SensorManagementEnabled
Enable sensor management for account
.PARAMETER TargetOu
Target OU
.PARAMETER DspmEnabled
DSPM enabled
.PARAMETER DspmRole
DSPM role ARN
.LINK
https://github.com/crowdstrike/psfalcon/wiki/New-FalconCloudAwsAccount
#>
  [CmdletBinding(DefaultParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:post',
    SupportsShouldProcess)]
  [Alias('New-FalconHorizonAwsAccount')]
  param(
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:post',Mandatory,Position=1)]
    [ValidatePattern('^\d{12}$')]
    [Alias('account_id')]
    [string]$AccountId,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:post',Mandatory,Position=2)]
    [Alias('cloudtrail_region')]
    [string]$CloudtrailRegion,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:post',ValueFromPipelineByPropertyName,
      Position=3)]
    [ValidatePattern('^\d{12}$')]
    [Alias('organization_id')]
    [string]$OrganizationId,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:post',ValueFromPipelineByPropertyName,
      Position=4)]
    [Alias('account_type')]
    [string]$AccountType,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:post',ValueFromPipelineByPropertyName,
      Position=5)]
    [Alias('is_master')]
    [boolean]$IsMaster,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:post',ValueFromPipelineByPropertyName,
      Position=6)]
    [Alias('iam_role_arn')]
    [string]$IamRoleArn,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:post',ValueFromPipelineByPropertyName,
      Position=7)]
    [Alias('use_existing_cloudtrail')]
    [boolean]$UseExistingCloudtrail,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:post',ValueFromPipelineByPropertyName,
      Position=8)]
    [Alias('behavior_assessment_enabled')]
    [boolean]$BehaviorAssessmentEnabled,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:post',ValueFromPipelineByPropertyName,
      Position=9)]
    [Alias('sensor_management_enabled')]
    [boolean]$SensorManagementEnabled,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:post',ValueFromPipelineByPropertyName,
      Position=10)]
    [Alias('target_ous')]
    [string[]]$TargetOu,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:post',ValueFromPipelineByPropertyName,
      Position=11)]
    [Alias('dspm_enabled')]
    [boolean]$DspmEnabled,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:post',ValueFromPipelineByPropertyName,
      Position=12)]
    [Alias('dspm_role')]
    [string]$DspmRole
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function Receive-FalconCloudAwsScript {
<#
.SYNOPSIS
Download a Bash script which grants Falcon Cloud Security access using the AWS CLI
.DESCRIPTION
Requires 'CSPM registration: Read'.
.PARAMETER Id
AWS account identifier
.PARAMETER OrganizationId
AWS organization identifier
.PARAMETER Template
Template to be rendered
.PARAMETER Account
List of AWS accounts to register
.PARAMETER AccountType
Type of account
.PARAMETER AwsProfile
AWS profile to use during registration
.PARAMETER CustomRole
Custom IAM role to be use during registration
.PARAMETER BehaviorAssessment
Enable behavior assessment
.PARAMETER SensorManagement
Enable sensor management
.PARAMETER ExistingCloudtrail
Use existing Cloudtrail
.PARAMETER DspmEnabled
Enable DSPM
.PARAMETER DspmRegions
DSPM region
.PARAMETER DspmRole
DSPM role
.PARAMETER Path
Destination path
.PARAMETER Force
Overwrite existing file when present
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Receive-FalconCloudAwsScript
#>
  [CmdletBinding(DefaultParameterSetName='/cloud-connect-cspm-aws/entities/user-scripts-download/v1:get',
    SupportsShouldProcess)]
  [Alias('Receive-FalconHorizonAwsScript')]
  param(
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/user-scripts-download/v1:get',
      ValueFromPipelineByPropertyName,ValueFromPipeline,Position=1)]
    [ValidatePattern('^\d{12}$')]
    [Alias('ids')]
    [string[]]$Id,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/user-scripts-download/v1:get',Position=2)]
    [Alias('organization_id')]
    [string]$OrganizationId,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/user-scripts-download/v1:get',Position=3)]
    [ValidateSet('aws-bash','aws-terraform',IgnoreCase=$false)]
    [string]$Template,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/user-scripts-download/v1:get',Position=4)]
    [Alias('accounts')]
    [string[]]$Account,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/user-scripts-download/v1:get',Position=5)]
    [ValidateSet('commercial','gov',IgnoreCase=$false)]
    [Alias('account_type')]
    [string]$AccountType,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/user-scripts-download/v1:get',Position=6)]
    [Alias('aws_profile')]
    [string]$AwsProfile,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/user-scripts-download/v1:get',Position=7)]
    [Alias('custom_role_name')]
    [string]$CustomRole,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/user-scripts-download/v1:get',Position=8)]
    [Alias('behavior_assessment_enabled')]
    [boolean]$BehaviorAssessment,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/user-scripts-download/v1:get',Position=9)]
    [Alias('sensor_management_enabled')]
    [boolean]$SensorManagement,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/user-scripts-download/v1:get',Position=10)]
    [Alias('use_existing_cloudtrail')]
    [boolean]$ExistingCloudtrail,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/user-scripts-download/v1:get',Position=11)]
    [Alias('dspm_enabled')]
    [boolean]$DspmEnabled,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/user-scripts-download/v1:get',Position=12)]
    [Alias('dspm_role')]
    [string]$DspmRole,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/user-scripts-download/v1:get',Position=13)]
    [Alias('dspm_regions')]
    [string[]]$DspmRegion,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/user-scripts-download/v1:get',Mandatory,
      Position=14)]
    [string]$Path,
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/user-scripts-download/v1:get')]
    [switch]$Force
  )
  begin {
    $Param = @{
      Command = $MyInvocation.MyCommand.Name
      Endpoint = $PSCmdlet.ParameterSetName
      Headers = @{ Accept = 'application/octet-stream' }
      Format = Get-EndpointFormat $PSCmdlet.ParameterSetName
    }
    $Param.Format['Outfile'] = 'path'
  }
  process {
    $PSBoundParameters.Path = Assert-Extension $PSBoundParameters.Path 'sh'
    $OutPath = Test-OutFile $PSBoundParameters.Path
    if ($OutPath.Category -eq 'ObjectNotFound') {
      Write-Error @OutPath
    } elseif ($PSBoundParameters.Path) {
      if ($OutPath.Category -eq 'WriteError' -and !$Force) {
        Write-Error @OutPath
      } else {
        Invoke-Falcon @Param -UserInput $PSBoundParameters
      }
    }
  }
}
function Remove-FalconCloudAwsAccount {
<#
.SYNOPSIS
Remove Falcon Cloud Security AWS accounts
.DESCRIPTION
Requires 'CSPM registration: Write'.
.PARAMETER Id
AWS account identifier
.PARAMETER OrganizationId
AWS organization identifier
.LINK
https://github.com/crowdstrike/psfalcon/wiki/Remove-FalconCloudAwsAccount
#>
  [CmdletBinding(DefaultParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:delete',
    SupportsShouldProcess)]
  [Alias('Remove-FalconHorizonAwsAccount')]
  param(
    [Parameter(ParameterSetName='/cloud-connect-cspm-aws/entities/account/v1:delete',Mandatory,
      ValueFromPipelineByPropertyName,ValueFromPipeline,Position=1)]
    [ValidatePattern('^\d{12}$')]
    [Alias('ids')]
    [string[]]$Id,
    [Parameter(ParameterSetName='OrganizationIds',Mandatory)]
    [ValidatePattern('^o-[0-9a-z]{10,32}$')]
    [Alias('organization-ids','OrganizationIds')]
    [string[]]$OrganizationId
  )
  begin {
    $Param = @{
      Command = $MyInvocation.MyCommand.Name
      Endpoint = '/cloud-connect-cspm-aws/entities/account/v1:delete'
    }
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