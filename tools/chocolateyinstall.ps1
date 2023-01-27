﻿$checksum = "ff19197f17ec5abff357db80b3cd5f31a71d69e2b6f51bdb0e1363afaf416e78"
$ErrorActionPreference = 'Stop';
$packageName = 'skaffold'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$version = $env:ChocolateyPackageVersion
$url = "https://github.com/GoogleContainerTools/skaffold/releases/download/v$version/skaffold-windows-amd64.exe"
$checksumtype = "sha256"
$destination = "$toolsPath\skaffold-windows-amd64.exe"

if (Test-Path "$toolsPath\skaffold.exe") {
  Remove-Item "$toolsPath\skaffold.exe"
  Remove-Item "$toolsPath\*.sha256"
  Uninstall-BinFile -Name "skaffold" -Path "$toolsPath"
}

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $destination -Url64bit $url -Checksum64 $checksum -ChecksumType64 $checksumtype

Rename-Item -Path "$toolsPath\skaffold-windows-amd64.exe" -NewName "skaffold.exe"
Install-BinFile -Name "skaffold" -Path "$toolsPath"
