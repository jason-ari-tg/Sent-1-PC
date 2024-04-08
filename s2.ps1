# Set the URL and destination file path
$url = "https://www.dropbox.com/scl/fi/er74lkid70luax5ygxnc0/SentinelInstaller_windows_64bit_v23_3_3_264.msi?rlkey=gh2025cfe3rs7jx86e4k0e4hs&dl=1"
$dest = "$PWD\SentinelInstaller_windows_64bit_v23_3_3_264.msi"

# Download the file from Dropbox
Invoke-WebRequest -Uri $url -OutFile $dest

# Install the package silently
$installerArgs = @(
    "/i",
    "$filePath",
    "/qn",
    "/norestart",
    "--dont_fail_on_config_preserving_failures",
    "-t",
    "eyJ1cmwiOiAiaHR0cHM6Ly91c2VhMS0wMTcuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogImdfMWI3ODYzMDdkYzExNmYzYiJ9"
)
Start-Process -FilePath "msiexec.exe" -ArgumentList $installerArgs -Wait

# Check if the application is running
$appName = "Sentinel"
$process = Get-Process | Where-Object { $_.Name -eq $appName }

if ($process) {
    Write-Host "$appName is installed and running."
} else {
    Write-Host "$appName is installed but not running."
}
