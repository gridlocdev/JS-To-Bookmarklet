# File name pulled from the configuration file settings.json
$config = Get-Content "./settings.json" | ConvertFrom-Json

$fileName = $config.script_name;

# Starts the script in this PowerShell script's root directory
Set-Location($PSScriptRoot);

# Checks if the configuration file's folder name ends with a "/", and adds it if it does not have it
if ($config.input_folder.EndsWith("/") -eq $false) {
    $config.input_folder += "/";
}
if ($config.output_folder.EndsWith("/") -eq $false) {
    $config.output_folder += "/";
}

$inputFilePath = $config.input_folder + $fileName;
$outputFilePath = $config.output_folder + "$($fileName).bookmarklet.txt";

# Test the file paths for validity
if (Test-Path($inputFilePath)) {
    # Check to see if the file is a JavaScript file
    if ($inputFilePath.Contains(".js") -eq $false) {
        Write-Warning("ERROR: [[Non-JavaScript file detected]] Please supply a JavaScript file!");
        Write-Host("`n" + "Press any key to close this window...");
        $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
        Exit
    }
    # Check to see if the file is empty
    if ((Get-Content($inputFilePath)).Length -eq 0) {
        Write-Warning("ERROR: [[Empty file detected]] Please add content to your JavaScript file! It'd be silly to create a bookmarklet that doesn't do anything.");
        Write-Host("`n" + "Press any key to close this window...");
        $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
        Exit
    }
}
else {
    Write-Warning("ERROR: [[File not found]] Please verify the name in the " + "$" + "fileName parameter is correct!");
    Write-Host("`n" + "Press any key to close this window...");
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    Exit
}

# If the output file exists, remove it before we create it again.
if (Test-Path($outputFilePath)) {
    Remove-Item($outputFilePath);
}
New-Item($outputFilePath) | Out-Null

# Get the contents of the input file, and also validate it to see if it's already a bookmarklet
$inputFile = Get-Content($inputFilePath);
$inputFile_measuredText = Get-Content $inputFilePath | Measure-Object -Line

if (($inputFile.StartsWith("Javascript:(function(){")) -and ($inputFile_measuredText.Lines -eq 1))
{
    Write-Warning("ERROR: [[Bookmarklet detected]] This is probably already a Bookmarklet, or you've just got some funky syntax in this script.");
    Write-Host("`n" + "Press any key to close this window...");
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    Exit
}

# Convert the file to a bookmarklet
$output = "Javascript:(function(){" + [string]::join("", $inputFile.Split(" ")) + "})();";

# Write the contents to the output file
Set-Content -path $outputFilePath -value $output;

# User confirmation messages
Write-Host("Your Bookmarklet has been created successfully! " + "`n");
Write-Host("Your script is ready at: $($outputFilePath)" + "`n");
Write-Host("Press any key to close this window...");
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');