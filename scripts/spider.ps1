Import-Module .\modules\downloadArtifact.psm1
Get-LatestArtifact -Owner Summpot -Repository TranslationPlatform;
gci ./tools/temp;