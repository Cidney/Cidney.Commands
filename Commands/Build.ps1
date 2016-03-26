function Build
{
    [CmdletBinding()]
    param
    (
        [string]
        $Path,
        [string]
        $LocalPath,
        [string]
        $SolutionName,
        [pscredential]
        $Credential,
        [string]
        $TfsServer
    )
    
    Import-Module PSBuild -Force

    $solutionPath = Join-Path $LocalPath $SolutionName
    if (-not $PSBoundParameters['SolutionName'])
    {
        $SolutionName = '{0}.sln' -f (Split-Path $Path -Leaf)
    }
    $workspaceName = $SolutionName -replace '.sln'

    Write-Host "Getting Source for $Path"
    $null = GetSource -Name $TfsServer -WorkspaceName $workspaceName -Path $Path -LocalPath $LocalPath #-Credential $credential
    Write-output "Restoring Nuget Packages for $SolutionPath"
    $null = RestorePackages -Path $solutionPath -source 'https://www.nuget.org/api/v2'
    Write-output "Building Solution $SolutionName at $SolutionPath"
    $null = Invoke-MSBuild $solutionPath #-configuration 'Release' 
}