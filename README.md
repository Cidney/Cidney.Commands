# **Cidney Commands**

Cidney: A Continuous Integration and Deployment DSL in Powershell

----------

Tags: CI, Continuous Integration, Continuous Deployment, DevOps, Powershell, DSL 

**Install**
Add this module to C:\Program Files\WindowsPowershell\Modules\Cidney.Commands

**Use**
Import-Module Cidney.Commands

I welcome any and all who wish to help out and contribute to this project.

This is a set of commands for doing TFS source control, Nuget package restore, Msbuild and other deployment related functionality. Meant to be used with Cidney

**Cidney** is a Continuous Integration and Deployment DSL written in Powershell. Using the concept of **Pipelines** and **Stages** tasks can be performed sequentially and in parallel to easily automate your process.

----------

**Commands**

**Get-TfsSource (Alias GetSource)**

Gets a local copy of source files from TFS.
This function will create a Local WorkSpace and a mapping to a local folder and then download all the files
Will output basic messages to Success output: Getting Source and Downloading source.
Verbose output shows connecting to TFS Server, Creating workspace and a done message with time in seconds to get files.
Debug output will display list of files downloaded.

Requires Microsoft Visual Studio Team Foundation Server Power Tools
See: https://visualstudiogallery.msdn.microsoft.com/898a828a-af00-42c6-bbb2-530dc7b8f2e1
       
    Get-TfsSource -Name http://tfs.example.com:8080/tfs/Collection -WorkspaceName 'MyWorkSpace' -LocalPath C:\Projects -Path $\Projects

    Gets files from $\Projects to c:\projects


    Get-TfsSource -Name http://tfs.example.com:8080/tfs/Collection -WorkspaceName 'MyWorkSpace' -LocalPath C:\Projects -Path $\Projects -VersionSpec 'LRelease 5.0.0.1'

    Gets the version of source labeled Release 5.0.0.1 from Server path $\Projects to local path c:\Projects


**Invoke-NugetRestore (Alias RestorePackages)**

Does a Nuget Package restore using the supplied path
Requires Nuget.exe to be on the computer this is being run and the location set in the $env:NugetPath environment variable
or or supplied in the parameters 

Download Nuget: https://dist.nuget.org/index.html

    Invoke-NugetRestore -Path c:\Projects\MyProject -Source http://nuget.example.com/nuget 

    Restores Nuget packages from private source http://nuget.example.com/nuget 

----------

**TODO:**

There are a ton of things I want to get to and things I would like to investigate

Done:
* Get-TfsSource
* Invoke-NugetRestore

Next:
* AppX installer
* Website
* Start-TfsBuild
* New-Container
* New-Environment
* Deployer

