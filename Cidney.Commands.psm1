$ScriptPath = Split-Path $MyInvocation.MyCommand.Path
$CidneyPath = Split-Path (Get-Module Cidney).Path -Parent

#region Load Command Files
try 
{
    Get-ChildItem (Join-Path $ScriptPath 'Commands') -Filter *.ps1 | Select-Object -ExpandProperty FullName | 
		ForEach-Object {
			$File = Split-Path $PSItem -Leaf
			. $PSItem
		}
} 
catch 
{
    Write-Warning ('[Module Load] {0}: {1}' -f $File, $PSItem.Exception.Message)
    Continue
}
#endregion Load Command Functions

Set-Alias -Name GetSource -Value Get-TfsSource -Description 'Simplified command name to that it looks cleaner in Pipeline:' -Force
Set-Alias -Name RestorePackages -Value Invoke-NugetRestore -Description 'Simplified command name to that it looks cleaner in Pipeline:' -Force

Export-ModuleMember -Function Build
Export-ModuleMember -Function Get-TfsSource -Alias GetSource
Export-ModuleMember -Function Invoke-NugetRestore -Alias RestorePackages
