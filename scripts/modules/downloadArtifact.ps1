function Get-LatestArtifact{
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Owner,
        [Parameter()]
        [string]
        $Repository
    )
    $resp = (Invoke-WebRequest -Uri "https://api.github.com/repos/$Owner/$Repository/actions/artifacts").Content|ConvertFrom-Json;
    $url = $resp.artifacts[0].archive_download_url;
    Invoke-WebRequest -Uri $url -Headers @{Authorization="Bearer $env:token"} -OutFile ./temp.zip;
    Expand-Archive -Path ./temp.zip -DestinationPath ./tools/temp;
    Remove-Item ./temp.zip;
}