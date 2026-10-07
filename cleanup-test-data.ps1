$ErrorActionPreference = 'Stop'
$base = 'D:\Drivers\Audio\Realtek\CtdAudio_1.19.4'
$running = Get-CimInstance Win32_Process | Where-Object {
    $_.Name -match '^java(w)?\.exe$' -and $_.CommandLine -like "*$base*"
}
if ($running) { throw 'Close Minecraft and its launcher before removing test data.' }
$paths = @(
    'D:\Drivers\Audio\Realtek\CtdAudio_1.19.4\new\flame-talisman\run',
    'D:\Drivers\Audio\Realtek\CtdAudio_1.19.4\.minecraft\saves\blade-test-1791246121183'
)
foreach ($path in $paths) {
    if (-not (Test-Path -LiteralPath $path)) { continue }
    $resolved = (Resolve-Path -LiteralPath $path).Path
    if (-not $resolved.Equals($path, [StringComparison]::OrdinalIgnoreCase)) { throw "Unexpected target: $resolved" }
    $item = Get-Item -LiteralPath $resolved -Force
    if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) { throw 'Refusing a junction or symbolic link.' }
    if (Get-ChildItem -LiteralPath $resolved -Recurse -Force | Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint }) {
        throw 'Refusing a directory containing a junction or symbolic link.'
    }
    Remove-Item -LiteralPath $resolved -Recurse -Force
    Write-Host "Removed test data: $resolved"
}
Write-Host 'Done. Your HMCL, original Minecraft instance, other saves and build dependencies were kept.'
