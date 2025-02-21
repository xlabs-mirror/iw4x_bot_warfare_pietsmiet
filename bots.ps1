$outputFile = "bots.txt"

# Remove the output file if it already exists
if (Test-Path $outputFile) { Remove-Item $outputFile }

# Get all .txt files in the "bots" folder
$files = Get-ChildItem -Path "bots\*.txt" -Recurse

# Loop through all files
foreach ($file in $files) {
    # Get a random line from the current file
    $randomLine = Get-Content $file | Get-Random
    # Write the random line to the output file
    Add-Content -Path $outputFile -Value $randomLine
}
(Get-Content $outputFile) | Where-Object {$_ -ne ""} | Set-Content $outputFile

Write-Host "All done!"
