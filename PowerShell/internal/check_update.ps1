# Get version number from arguments
$MCGradleCurrentVer = $args[0]

try
{
    # Hide download progress from user
    $ProgressPreference = 'SilentlyContinue'

    # Attempt to download the update file
    $MCResponse = Invoke-WebRequest -TimeoutSec 10 https://raw.githubusercontent.com/Jonathing/MCGradle-Scripts/master/VERSIONS.txt -OutFile '.\Scripts\PowerShell\internal\VERSIONS.txt'
    
    # Revert environment variable change
    $ProgressPreference = 'Continue'

    # Get status code from web request
    $StatusCode = $MCResponse.StatusCode
}
catch
{
    $StatusCode = $_.Exception.MCResponse.StatusCode.value__
}

if ($StatusCode)
{
    # Inform user that the update check failed.
    $MCGradleFailMsg1 = "MCGradle Scripts failed to check for updates!"
    $MCGradleFailMsg2 = "We got a " + $StatusCode + " error when downloading latest version file."
    $MCGradleFailMsg3 = "Please report this to the MCGradle Scripts issue tracker!"
    $MCGradleFailMsg4 = "https://github.com/Jonathing/MCGradle-Scripts/issues"
    Write-Host $MCGradleFailMsg1
    Write-Host $MCGradleFailMsg2
    Write-Host $MCGradleFailMsg3
    Write-Host $MCGradleFailMsg4
    Write-Host ""
}
else
{
    # Get the LATESTVERSION line from the update file
    $MCGradleUpdateVer = Get-Content '.\Scripts\PowerShell\internal\VERSIONS.txt' | Where-Object {$_ -like '*LATESTVERSION=*'}

    # Ddelete the update file
    Remove-Item '.\Scripts\PowerShell\internal\VERSIONS.txt'

    if ($MCGradleUpdateVer)
    {
        # Extract string within double quotes
        $MCTrueUpdateVer = $MCGradleUpdateVer|%{$_.split('"')[1]}
    }
}

if ($MCTrueUpdateVer)
{
    if ($MCTrueUpdateVer -ne $MCGradleCurrentVer)
    {
        $MCGradleUpdateMsg1 = "An update is available for MCGradle Scripts! The latest version is " + $MCTrueUpdateVer
        $MCGradleUpdateMsg2 = "To update, read " + [char]0x0022 + "UPDATE.md" + [char]0x0022 + " on how to update MCGradle Scripts in your repository."
        Write-Host $MCGradleUpdateMsg1
        Write-Host $MCGradleUpdateMsg2
        Write-Host ""
    }
}
else
{
    # Inform user that the update check failed.
    $MCGradleFailMsg1 = "MCGradle Scripts failed to check for updates!"
    $MCGradleFailMsg2 = "Please report this to the MCGradle Scripts issue tracker!"
    $MCGradleFailMsg3 = "https://github.com/Jonathing/MCGradle-Scripts/issues"
    Write-Host $MCGradleFailMsg1
    Write-Host $MCGradleFailMsg2
    Write-Host $MCGradleFailMsg3
    Write-Host ""
}