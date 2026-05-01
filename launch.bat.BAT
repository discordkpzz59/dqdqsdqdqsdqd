
@echo off
echo Launching VM BYPASS...

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Start-Process PowerShell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command ^
$Config = @{ VMName = ''NXR''; VMMemory = 8192MB; VMCores = 4; MinRsrc = 80000000; MaxRsrc = 100000000; OptimalRsrc = 100000000 }; ^
try { ^
$VMHost = Get-VMHost; ^
$VMVersion = $VMHost.SupportedVmVersions[$VMHost.SupportedVmVersions.Count - 1]; ^
$VMObject = Get-VM -Name $Config.VMName -ErrorAction SilentlyContinue; ^
if (-not $VMObject) { ^
New-VM -Name $Config.VMName -MemoryStartupBytes $Config.VMMemory -Generation 2 -Version $VMVersion; ^
}; ^
Set-VM -VMName $Config.VMName -GuestControlledCacheTypes $true -LowMemoryMappedIoSpace 1GB -HighMemoryMappedIoSpace 32GB -AutomaticStopAction TurnOff -CheckpointType Disabled; ^
Set-VMFirmware -VMName $Config.VMName -EnableSecureBoot Off; ^
$GPUParams = @{ VMName=$Config.VMName; MinPartitionVRAM=$Config.MinRsrc; MaxPartitionVRAM=$Config.MaxRsrc; OptimalPartitionVRAM=$Config.OptimalRsrc; MinPartitionEncode=$Config.MinRsrc; MaxPartitionEncode=$Config.MaxRsrc; OptimalPartitionEncode=$Config.OptimalRsrc; MinPartitionDecode=$Config.MinRsrc; MaxPartitionDecode=$Config.MaxRsrc; OptimalPartitionDecode=$Config.OptimalRsrc; MinPartitionCompute=$Config.MinRsrc; MaxPartitionCompute=$Config.MaxRsrc; OptimalPartitionCompute=$Config.OptimalRsrc }; ^
$VMAdapter = Get-VMGpuPartitionAdapter -VMName $Config.VMName -ErrorAction SilentlyContinue; ^
if ($VMAdapter) { Set-VMGpuPartitionAdapter @GPUParams } else { Add-VMGpuPartitionAdapter @GPUParams }; ^
} catch { Write-Host $_ }'"

echo Done.
pause
exit