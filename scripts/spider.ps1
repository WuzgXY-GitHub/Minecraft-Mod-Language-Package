Import-Module .\modules\downloadArtifact.ps1
Get-LatestArtifact -Owner Summpot -Repository TranslationPlatform;
gci ./tools/temp;