# File name pulled from the configuration file settings.json
$config = Get-Content "./settings.json" | ConvertFrom-Json

$fileName = $config.script_name

# Starts the script in this PowerShell script's root directory
Set-Location($PSScriptRoot);

$inputFilePath = "./$($fileName)"

# Checks if the configuration file's folder name ends with a "/", and adds it if it does not have it
if ($config.bookmarklet_output_folder.EndsWith("/") -eq $false) {
    $config.bookmarklet_output_folder += "/"
}

$outputFilePath = $config.bookmarklet_output_folder + "$($fileName).bookmarklet.txt"

# Test the file paths for validity
if (Test-Path($inputFilePath)) {
    # Check to see if the file is a JavaScript file
    if ($inputFilePath.Contains(".js") -eq $false) {
        Write-Warning("ERROR: [[Non-JavaScript file detected]] Please supply a JavaScript file!")
        Exit
    }
    # Check to see if the file is empty
    (Get-Content($inputFilePath)).Length
    if ((Get-Content($inputFilePath)).Length -eq 0) {
        Write-Warning("ERROR: [[Empty file detected]] Please add content to your JavaScript file! It'd be silly to create a bookmarklet that doesn't do anything.")
        Exit
    }
}
else {
    Write-Warning("ERROR: [[File not found]] Please verify the name in the " + "$" + "fileName parameter is correct!")
    Exit
}

# If the output file exists, remove it before we create it again.
if (Test-Path($outputFilePath)) {
    Remove-Item($outputFilePath)
}

New-Item($outputFilePath)

$inputFile = Get-Content($inputFilePath)
$output = "Javascript:(function(){" + [string]::join("", $inputFile.Split(" ")) + "})();"

Set-Content -path $outputFilePath -value $output