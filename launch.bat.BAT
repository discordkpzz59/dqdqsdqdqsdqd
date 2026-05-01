::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFAxdQjimOXixEroM1P72r+ieskwOaNQSOK3i6pW9E64W8kCE
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
chcp 65001 >nul
color 0a
title NXR TOOL

:login
cls
echo.
echo =========================
echo        NXR TOOL
echo =========================
echo.

set /p key=Enter license key: 

set valid=0

for %%K in (
NXR-8593-9482-8329
NXR-1029-5581-7099
NXR-7741-2208-3399
NXR-3902-6714-8899
NXR-9183-4407-1299
NXR-5562-8031-9979
NXR-2301-6648-4419
NXR-8410-2957-6639
NXR-6739-1820-5549
NXR-1093-7752-8809
NXR-4821-9036-7719
NXR-9504-1168-2209
NXR-3308-7421-9959
NXR-6157-2089-3349
NXR-7890-4312-6689
NXR-1449-9023-5579
NXR-9021-3387-1109
NXR-6672-8150-4439
NXR-2839-4701-9929
NXR-5108-6294-7719
NXR-8392-1056-4409
NXR-2710-9843-5569
NXR-6049-3172-8899
NXR-1183-7605-2239
NXR-9471-5028-6619
NXR-3520-9184-7749
NXR-7801-2346-9909
NXR-4295-6103-3389
NXR-9938-1472-5529
NXR-5604-8291-1169
) do (
    if /I "%key%"=="%%K" set valid=1
)

if "%valid%"=="1" goto good

goto bad


:bad
echo Invalid key!
timeout /t 2 >nul
goto login


:good
echo Key accepted!
timeout /t 1 >nul


:menu
cls
echo =========================
echo        NXR MENU
echo =========================
echo.
echo 1 - VM BYPASS
echo 2 - Exit
echo.
set /p choice=Choose option: 

if "%choice%"=="1" goto vm
if "%choice%"=="2" exit
goto menu


:vm
cls
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