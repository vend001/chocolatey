﻿
$ErrorActionPreference = 'Stop';


$packageName= 'PhraseExpress.Install'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.phraseexpress.com/PhraseExpressSetup.msi' 
$url64      = $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'PhraseExpress*'
  checksum      = '267D9AF090B9A220DC69488DCA44E70E89D525A7B1A7311D051560ECC39E2F79'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs