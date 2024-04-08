# Download the installer from Dropbox
$url = "https://www.dropbox.com/scl/fi/fg7jtsr5vmyfmgy69hlul/SentinelOneInstaller_windows_64bit_v23_3_3_264.exe?rlkey=y5svt72pyw8hv4elz77b3pipi&dl=1"
$filePath = "$PWD\SentinelOneInstaller_windows_64bit_v23_3_3_264.exe"
Invoke-WebRequest -Uri $url -OutFile $filePath

# Define the log file paths for standard output and standard error
$logFilePathOut = "$PWD\SentinelOneInstallationLog_Out.txt"
$logFilePathErr = "$PWD\SentinelOneInstallationLog_Err.txt"

# Install the package silently with the site token and redirect output to separate log files
$siteToken = "eyJ1cmwiOiAiaHR0cHM6Ly91c2VhMS0wMTcuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogImdfMWI3ODYzMDdkYzExNmYzYiJ9"
Start-Process -FilePath "$filePath" -ArgumentList "-q", "-t=$siteToken" -RedirectStandardOutput $logFilePathOut -RedirectStandardError $logFilePathErr -Wait

# Check if the application is running
$appName = "SentinelOne"
$process = Get-Process | Where-Object { $_.Name -eq $appName }

if ($process) {
    Write-Host "$appName is installed and running."
} else {
    Write-Host "$appName is installed but not running."
    Write-Host "Check the log files at $logFilePathOut and $logFilePathErr for more details."
}
