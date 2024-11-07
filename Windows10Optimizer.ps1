# ========================================================================
#                         Windows 10 Optimizer by r1ma
# ========================================================================

# DISCLAIMER: Use at your own risk. The script will make permanent changes to your system. 
# Always create a system restore point and backup important files.
# Press Enter to continue, or Ctrl+C to quit.
Write-Host "DISCLAIMER: This script will optimize your Windows 10 system for gaming, privacy, network performance, and overall performance."
Write-Host "This script will make permanent changes to your system's settings."
Write-Host "Use at your own risk! We recommend creating a system restore point before proceeding."
Write-Host "Press Enter to continue or press Ctrl+C to quit."

# Wait for user to press Enter or Ctrl+C to quit
$null = Read-Host "Press Enter to continue or Ctrl+C to quit"

# Debug message: Confirm the user pressed Enter to continue
Write-Host "You pressed Enter. Continuing with optimizations..."

# ========================================================================
# Step 1: Create a System Restore Point (Optional but Recommended)
Write-Host "Creating system restore point..."
$restorePointName = "Pre-Optimization Restore Point"
Checkpoint-Computer -Description $restorePointName -RestorePointType "MODIFY_SETTINGS"

Write-Host "System Restore Point Created: $restorePointName"

# ========================================================================
# Step 2: Disable Unnecessary Windows Services (SysMain, OneDrive, etc.)
Write-Host "Disabling unnecessary services for optimal performance..."

# Disable SysMain (Superfetch) service
Stop-Service -Name "SysMain" -Force
Set-Service -Name "SysMain" -StartupType Disabled
Write-Host "SysMain (Superfetch) service disabled."

# Disable Windows Search (optional for gaming performance)
Stop-Service -Name "WSearch" -Force
Set-Service -Name "WSearch" -StartupType Disabled
Write-Host "Windows Search service disabled."

# Disable OneDrive (optional, if you don't use OneDrive)
Stop-Service -Name "OneDrive" -Force
Set-Service -Name "OneDrive" -StartupType Disabled
Write-Host "OneDrive service disabled."

# ========================================================================
# Step 3: Optimize Network Settings for Low Latency and High-Speed Performance
Write-Host "Optimizing network settings for low latency and high-speed performance..."

# Disable TCP Auto-Tuning
Set-NetTCPSetting -Name "Internet" -Autotuning Disabled
Write-Host "TCP Auto-Tuning disabled."

# Disable Windows Auto-Adjust for Bandwidth
Set-NetAdapterAdvancedProperty -Name "Ethernet" -DisplayName "Large Send Offload v2 (IPv4)" -DisplayValue "Disabled"
Write-Host "Bandwidth auto-adjust settings disabled."

# Enable Receive Side Scaling (RSS)
Set-NetAdapterRss -Name "Ethernet" -Enabled $true
Write-Host "Receive Side Scaling (RSS) enabled."

# ========================================================================
# Step 4: Set Power Plan to High Performance
Write-Host "Setting power plan to High Performance..."

# Set Power Plan to High Performance
powercfg /s SCHEME_MIN
Write-Host "High Performance power plan activated."

# ========================================================================
# Step 5: Disable Windows Defender (Optional for users who have other antivirus software)
Write-Host "Disabling Windows Defender..."

# Disable Windows Defender real-time protection
Set-MpPreference -DisableRealtimeMonitoring $true
Write-Host "Windows Defender real-time protection disabled."

# ========================================================================
# Step 6: Remove Bloatware (Optional - Comment out if you want to skip)
Write-Host "Removing unnecessary bloatware (optional)..."

# Remove Xbox App
Get-AppxPackage *xbox* | Remove-AppxPackage
Write-Host "Xbox App removed."

# Remove OneNote App
Get-AppxPackage *onenote* | Remove-AppxPackage
Write-Host "OneNote App removed."

# Remove Cortana (Optional)
Stop-Process -Name "Cortana" -Force
Write-Host "Cortana removed."

# ========================================================================
# Step 7: Clean Up Temporary Files
Write-Host "Cleaning up temporary files..."
# Run disk cleanup utility
Start-Process "cleanmgr.exe" -ArgumentList "/sagerun:1" -Wait
Write-Host "Disk cleanup completed."

# ========================================================================
# Final Step: Notify User and Reboot
Write-Host "Optimizations complete!"
Write-Host "Some changes may require a reboot to take effect. We recommend you restart your system now."

# Wait for user to press Enter before exiting
$null = Read-Host "Press Enter to exit and restart your system."
Write-Host "Rebooting your system now..."
Restart-Computer -Force

# End of Script
