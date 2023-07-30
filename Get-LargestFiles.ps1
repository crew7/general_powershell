function Get-LargestFiles {
    Clear-Host
    "Scanning location recursively for largest files."
    "Generating terminal output and creating local file largest_files.txt..."
    Get-ChildItem -File -Recurse -Force -ErrorAction SilentlyContinue | 
    Sort-Object Length -Descending |
    Format-List Name,
    FullName,
    @{name="GB Size";expression={$_.length / 1GB}} |
    Tee-Object largest_files.txt | more
}
