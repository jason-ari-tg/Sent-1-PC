# Download the installer from Dropbox
$url = "https://dl.dropboxusercontent.com/scl/fi/er74lkid70luax5ygxnc0/SentinelInstaller_windows_64bit_v23_3_3_264.msi?dl=0"
$filePath = "$PWD\SentinelInstaller_windows_64bit_v23_3_3_264.msi"
Invoke-WebRequest -Uri $url -OutFile $filePath

# Install the package silently
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$filePath`" /qn /norestart SITE_TOKEN=eyJ1cmwiOiAiaHR0cHM6Ly91c2VhMS0wMTcuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogImdfMWI3ODYzMDdkYzExNmYzYiJ9" -Wait
