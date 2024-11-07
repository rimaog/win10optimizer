#Introduction

Welcome to the Windows 10 Optimization Tool created by r1ma! This tool is designed to optimize your Windows 10 system for gaming and overall performance, while also improving network settings for lower latency and better speed.

The script will apply several optimizations, including:

    Disabling telemetry to improve privacy and performance.
    Disabling unnecessary services (such as OneDrive, SysMain, etc.).
    Optimizing network settings for low latency and high-speed performance.
    Disabling unnecessary startup programs to free up system resources.
    Setting the system to a high-performance power plan for better CPU performance.
    Removing pre-installed bloatware (optional).
    Cleaning temporary files and running disk cleanup.

Disclaimer

    Use at your own risk: This script makes permanent changes to your system’s settings. While the optimizations are generally safe and beneficial, they may not be suitable for all users, especially if you rely on certain features like Windows Defender or automatic updates.

    Backup and Restore Point: It’s strongly recommended to create a system restore point and backup important data before running this tool. This will allow you to revert your system to its original state in case any issues arise.

    Administrator Rights Required: You must run the script with Administrator privileges for it to make system-level changes.

    Not Guaranteed for All Systems: This script is designed for Windows 10 and may not be suitable for older versions of Windows or systems with unique configurations. Always test on a VM or backup system first.

How to Set Execution Policy (If Needed)

In order to run the PowerShell script, you may need to adjust the execution policy on your system. This is necessary because, by default, PowerShell blocks the execution of scripts that are not digitally signed.

Follow these steps to allow the script to run:

    Open PowerShell as Administrator:
        Right-click the Start button and select Windows PowerShell (Admin), or search for PowerShell, right-click it, and select Run as Administrator.

    Check the Current Execution Policy: In the PowerShell window, type the following command and press Enter:

Get-ExecutionPolicy

If the output is Restricted or AllSigned, you’ll need to change it to run the script.

Set Execution Policy to Allow Script Execution: Type the following command to temporarily allow the script to run for the current session:

    Set-ExecutionPolicy Bypass -Scope Process -Force

    This command will allow scripts to run for this PowerShell session only, without affecting other sessions.

    Confirm the Change: If prompted, press Y (Yes) to confirm.

How to Run the Script

Once you have the script saved as a .ps1 file and set the execution policy, you can run the script by following these steps:

    Open PowerShell as Administrator (as described above).

    Navigate to the Directory where the script is located. For example:

cd "C:\Path\To\Your\Script"

Run the Script: To execute the script, use the following command:

    .\Windows10Optimizer.ps1

    Follow On-Screen Prompts: The script will start and show progress in the PowerShell window. Follow any instructions or prompts on the screen.

    Restart Your Computer:
    Once the script completes, it will recommend that you restart your computer for all optimizations to take full effect.

What the Tool Does

    Disables Telemetry: Stops Windows from sending diagnostic data, which can improve both performance and privacy.
    Optimizes Network Settings: Adjusts TCP/IP settings, disables Auto-Tuning, enables RSS, and tweaks other settings to reduce latency and increase download/upload speeds.
    Disables Unnecessary Services: Stops or disables background services like OneDrive, SysMain, and Windows Update (for gaming performance).
    Removes Bloatware: Optionally removes pre-installed apps that take up space and slow down your system.
    Sets High-Performance Power Plan: Configures your system to use the High-Performance power plan, ensuring full CPU performance when gaming or doing heavy tasks.
    Cleans Up Temporary Files: Runs disk cleanup and removes temporary files that can take up unnecessary disk space.

Important Notes

    Test Before Use: It’s recommended to first test the script on a VM or non-critical machine to ensure compatibility with your specific hardware or software configuration.
    Bloatware Removal: If you don’t want to remove pre-installed apps, you can comment out the section of the script that does this.
    Network Optimizations: If you're not using the system for gaming or high-performance networking tasks, you may want to disable certain network tweaks in the script.

Backup and Restore Point Instructions

To create a System Restore Point before running the script:

    Press Windows + R to open the Run dialog box.
    Type sysdm.cpl and press Enter.
    In the System Properties window, go to the System Protection tab.
    Select the drive you want to create a restore point for (usually C:).
    Click Create, name your restore point, and click Create again.

Troubleshooting

    Permissions Issues: If you encounter errors related to permissions, ensure you are running PowerShell as Administrator.
    Execution Policy Errors: If the script still doesn’t run, ensure you have set the execution policy to Bypass or RemoteSigned.
    Errors During Execution: If any part of the script fails, the error message should give you a clue on what went wrong. For example, some services might be already disabled or running, so the script may skip those steps.

Contact Information

For any issues, questions, or feedback, feel free to reach out to r1ma for support.
