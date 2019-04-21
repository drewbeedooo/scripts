<#
.NOTES 
	Name: Install-Google-File-Stream-Silent.ps1
	Author: Drew Roberts
	License: MIT
	Requires: PowerShell v4 or later, Windows 7, 8, or 10.
	Version History:
	1.0 - 4/11/2019 - Initial Release

.SYNOPSIS 
	Uninstalls the currently installed version of Google File Stream.

.SYNTAX
	[PS] C:\>.\Uninstall-Google-File-Stream-Silent.ps1

.DESCRIPTION 
	This script will silently detect and uninstall the current version of Google File Stream on whatever computer the script is run.

.RELATED LINKS
	https://www.github.com/azusapacificuniversity/scripts

.EXAMPLE 
	[PS] C:\>.\Uninstall-Google-File-Stream-Silent.ps1
#>

# Find current version of Google Drive File Stream on computer then force it to stop and uninstall it silently.
$gdrivefs = get-itemproperty 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*' | Select-Object DisplayName, DisplayVersion, UninstallString, PSChildName | Where-Object { $_.DisplayName -match "Google Drive File Stream"}
if ($gdrivefs) {
    $Uninstall = $gdrivefs.UninstallString
    & $Uninstall --silent --force_stop}