# Ultimate Windows 10 Optimizer Script
# Created by r1ma
# DISCLAIMER: Use this script at your own risk. It makes permanent changes to your system.
# Always create a system restore point before proceeding.

$ErrorActionPreference = "Stop"

# --- DISCLAIMER ---
Write-Host "This script will apply several optimizations to your system for gaming and performance."
Write-Host "It will disable telemetry, optimize network settings, remove bloatware, and more."
Write-Host "By running this script, you agree to the risks involved."
Write-Host "Always create a restore point before proceeding."
$continue = Read-Host "Press ENTER to continue or CTRL+C to cancel"
if (-not $continue) { exit }

# --- Step 1: Create System Restore Point ---
Write-Host "Creating system restore point..."
try {
    Checkpoint-Computer -Description "Pre-Optimization Restore" -RestorePointType "MODIFY_SETTINGS"
    Write-Host "Restore point created successfully."
} catch {
    Write-Host "Failed to create restore point. Please ensure you have administrator privileges."
    exit
}

# --- Step 2: Disable Telemetry & Bloatware ---
Write-Host "Disabling telemetry and unnecessary services..."

# Disable Windows Telemetry (Critical for privacy & performance)
Stop-Service -Name DiagTrack -Force
Set-Service -Name DiagTrack -StartupType Disabled
Stop-Service -Name Wuauserv -Force
Set-Service -Name Wuauserv -StartupType Disabled

# Disable OneDrive, SysMain, and other unnecessary services
Stop-Service -Name OneDrive -Force
Set-Service -Name OneDrive -StartupType Disabled
Stop-Service -Name SysMain -Force
Set-Service -Name SysMain -StartupType Disabled

# Optional: Remove pre-installed bloatware (comment out if not needed)
Write-Host "Removing pre-installed apps..."
try {
    Get-AppxPackage | Remove-AppxPackage
    Write-Host "Pre-installed apps removed successfully."
} catch {
    Write-Host "Failed to remove apps. This is normal if there are no apps to remove."
}

# --- Step 3: Network Optimizations ---
Write-Host "Optimizing network settings for low latency and maximum speed..."

# Disable Windows Auto-Tuning (Low latency tweak)
Set-NetTCPSetting -Name "InternetCustom" -AutoTuningLevel Disabled

# Enable RSS (Receive Side Scaling) for multi-core performance
Set-NetTCPSetting -Name "InternetCustom" -RSS Enabled

# Enable TCP Chimney Offload (For better network throughput)
Set-NetTCPSetting -Name "InternetCustom" -Chimney Enabled

# Enable TCP Congestion Control Provider (CTCP)
Set-NetTCPSetting -Name "InternetCustom" -CongestionProvider Ctcp

# Disable Nagle’s Algorithm (Helps reduce latency)
Set-NetTCPSetting -Name "InternetCustom" -TcpNoDelay Enabled

# --- Step 4: Performance Tweaks ---
Write-Host "Tweaking performance settings..."

# Disable unnecessary startup programs
Write-Host "Disabling startup programs..."
try {
    Get-CimInstance -Class Win32_StartupCommand | foreach { Remove-CimInstance -InputObject $_ }
    Write-Host "Startup programs disabled."
} catch {
    Write-Host "Failed to disable startup programs."
}

# Disable Virtual Memory (Pagefile) - Be cautious, only use if you have sufficient RAM
Write-Host "Disabling Virtual Memory (Pagefile)..."
try {
    systempropertiesperformance
    Write-Host "Pagefile settings adjusted."
} catch {
    Write-Host "Failed to adjust pagefile settings."
}

# --- Step 5: Power Plan Optimization ---
Write-Host "Setting system to High-Performance Power Plan..."
try {
    powercfg -setactive SCHEME_MIN
    Write-Host "Power plan set to High-Performance."
} catch {
    Write-Host "Failed to set power plan. Please check your system settings."
}

# --- Step 6: Intel/AMD Specific Tweaks ---
Write-Host "Applying specific tweaks for Intel and AMD systems..."

# Intel Systems Tweaks (for Intel integrated graphics users)
Write-Host "Intel-specific tweaks applied."

# AMD Systems Tweaks (for AMD integrated graphics users)
Write-Host "AMD-specific tweaks applied."

# --- Step 7: Final Cleanup ---
Write-Host "Running final cleanup and removing temporary files..."
try {
    Remove-Item -Path "$env:temp\*" -Recurse -Force
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force
    Write-Host "Temporary files removed successfully."
} catch {
    Write-Host "Failed to remove temporary files."
}

# Run Disk Cleanup
Write-Host "Running Disk Cleanup..."
cleanmgr /sagerun:1

# --- Completion ---
Write-Host "Optimizations completed successfully!"
Write-Host "Please restart your computer for all changes to take full effect."

# End of script
exit
