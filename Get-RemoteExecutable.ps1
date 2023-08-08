function Get-RemoteExecutable {
    Clear-Host

    $remote_computer = Read-Host "Enter Computer Name"
    "Checking path..."

    $path_valid = Test-Path "\\$remote_computer\c$"
    if ($path_valid) {
        "Remote computer has c$ share enabled.`n"
    } else {
        "Remote computer does not have c$ share enabled. Exiting..."
        exit
    }

    $file_name = Read-Host "Enter file name, or keywords of filename"
    "Scanning remote drive for executable..."

    Get-ChildItem -Path "\\$remote_computer\c$" -Include "*$file_name*.exe" -File -Recurse -Force -ErrorAction SilentlyContinue |
    Format-List Name, FullName
}
