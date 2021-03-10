#Select Cluster
function TRF-Select-Cluster
{
$clusters = Get-Cluster
Write-Host
Write-Host " ================ Select $DCChoice Cluster ================"  -ForegroundColor green
Write-Host
$i = 1
$clusters | ForEach-Object -Process {
    Write-Host " $i $($_.Name)"
	$i++
}
Write-Host
Write-Host
$selection = Read-Host " Please make a selection (Q to Quit)"

if($selection -eq 'Q'){
		 clear
}

else{
    $global:CLUChoice = $clusters[$selection -1].Name
    Write-Host " You chose cluster $CLUChoice"
	Start-Sleep -Second 1
	TRF-Choice-7x-SecurityGuide
}
}

#Security Guide Menu
function TRF-7x-SecurityGuide
{
    param (
        [string]$7xSecurityGuide = 'Select Guideline ID' 
    )
    Clear-Host
    Write-Host
	Write-Host " ================ $7xSecurityGuide ================" -ForegroundColor green
    Write-Host
    Write-Host " 1:  Automatically unlock a locked account after a specific amount of time"
    Write-Host " 2:  Set the count of maximum failed login attempts before the account is locked out"
    Write-Host " 3:  Do not permit password reuse"
	Write-Host " 4:  Establish a policy for password complexity"
	Write-Host " 5:  Use the Authentication Proxy to protect passwords during Active Directory domain joins"
	Write-Host " 6:  Use Active Directory for ESXi user authentication"
	Write-Host " 7:  Warning for potential hyperthreading security vulnerability is suppressed"
	Write-Host " 8:  Set a timeout to automatically terminate idle DCUI sessions"
	Write-Host " 9:  Configure or disable CIM"
	Write-Host " 10: Disable Managed Object Browser (MOB)"
	Write-Host " 11: Configure or disable SLP"
	Write-Host " 12: Configure or disable SNMP"
	Write-Host " 13: Disable SSH"
	Write-Host " 14: Configure the ESXi firewall for additional defense-in-depth"
	Write-Host " 15: Enable UEFI Secure Boot"
	Write-Host " 16: Ensure that a TPM 2.0 is installed and enabled on the host"
	Write-Host " 17: Hardware firmware is up to date"
	Write-Host " 18: Enable bidirectional/mutual CHAP authentication for iSCSI traffic"
	Write-Host " 19: Set DCUI.Access to allow trusted users to override lockdown mode"
	Write-Host " 20: Audit the users on the Exception Users List"
	Write-Host " 21: Enable normal lockdown mode to restrict access to ESXi"
	Write-Host " 22: Set the logging informational level"
	Write-Host " 23: Configure persistent logging"
	Write-Host " 24: Configure remote logging"
	Write-Host " 25: Block guest OS BPDU transmissions"
	Write-Host " 26: Audit use of dvfilter network APIs"
	Write-Host " 27: Ensure hardware management controller interfaces are isolated on their own network segment and protected with perimeter access controls"
	Write-Host " 28: Ensure ESXi management interfaces are isolated on their own network segment"
	Write-Host " 29: Ensure vMotion interfaces are isolated on their own network segment and protected with perimeter access controls"
	Write-Host " 30: Ensure vSAN interfaces are isolated on their own network segment and protected with perimeter access controls"
	Write-Host " 31: Audit use of server hardware out-of-band management network interfaces"
	Write-Host " 32: Ensure that the “Forged Transmits” policy is set to reject on both the vSphere Standard Switch and on its port groups"
	Write-Host " 33: Ensure that the “MAC Address Changes” policy is set to reject on both the vSphere Standard Switch and on its port groups"
	Write-Host " 34: Ensure that the “Promiscuous Mode” policy is set to reject on both the vSphere Standard Switch and on its port groups"
	Write-Host " 35: Disable ESXi Shell"
	Write-Host " 36: Set a timeout to automatically terminate idle ESXi Shell and SSH sessions"
	Write-Host " 37: Set a timeout to limit how long the ESXi Shell and SSH services are allowed to run"
	Write-Host " 38: Warning for support and troubleshooting interfaces is suppressed"
	Write-Host " 39: ESXi is a version with active maintenance by VMware"
	Write-Host " 40: Configure NTP or PTP"
	Write-Host " 41: Ensure that deprecated SSL/TLS protocols are disabled"
	Write-Host " 42: Restrict transparent page sharing to VMs configured with sched.mem.pshare.salt"
	Write-Host " 43: ESXi is up to date"
	Write-Host " 44: Verify Image Profile and VIB Acceptance Levels"
	Write-Host " 45: Only run binaries delivered via VIB"	
	Write-Host
	Write-Host " Q:  Press 'Q' to return to the previous menu." -ForegroundColor yellow
	
}
clear
#Security Guide Choice
function TRF-Choice-7x-SecurityGuide
{
TRF-7x-SecurityGuide –Title 'Select Check'
$selection = Read-Host " Please make a selection"
 switch ($selection)
  {
     '1' {
         'Automatically unlock a locked account after a specific amount of time'
		 Check-AutoUnlock
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '2' {
         'Set the count of maximum failed login attempts before the account is locked out'
		 Check-LockCount
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '3' {
         'Do not permit password reuse'
		 Check-PasswordReuse
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '4' {
         'Establish a policy for password complexity'
		 Check-PasswordComplexity
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '5' {
         'Use the Authentication Proxy to protect passwords during Active Directory domain joins'
		 Check-UseAuthProxy
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '6' {
         'Use Active Directory for ESXi user authentication'
		 Check-UseADAuth
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '7' {
         'Warning for potential hyperthreading security vulnerability is suppressed'
		 Check-HTVulnSuppress
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '8' {
         'Set a timeout to automatically terminate idle DCUI sessions'
		 Check-DCUITimeout
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '9' {
         'Configure or disable CIM'
		 Check-CIM
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '10' {
         'Disable Managed Object Browser (MOB)'
		 Check-DisabledMOB
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '11' {
         'Configure or disable SLP'
		 Check-DisabledSLP
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '12' {
         'Configure or disable SNMP'
		 check-DisabledSNMP
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '13' {
         'Disable SSH'
		 Check-DisabledSSH
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '14' {
         'Configure the ESXi firewall for additional defense-in-depth'
		 Check-RestrictFW
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '15' {
         'Enable UEFI Secure Boot'
		 Check-SecureBoot
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '16' {
         'Ensure that a TPM 20 is installed and enabled on the host'
		 Check-TPM20
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '17' {
         'Hardware firmware is up to date'
		 Check-HostFW
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '18' {
         'Enable bidirectional/mutual CHAP authentication for iSCSI traffic'
		 Check-iSCSIChap
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '19' {
         'Set DCUIAccess to allow trusted users to override lockdown mode'
		 Check-DCUIAccess
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '20' {
         'Audit the users on the Exception Users List'
		 Check-ExceptionUsers
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '21' {
         'Enable normal lockdown mode to restrict access to ESXi'
		 Check-LockdownMode
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '22' {
         'Set the logging informational level'
		 Check-LoggingLevel
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '23' {
         'Configure persistent logging'
		 Check-PersistentLogging
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '24' {
         'Configure remote logging'
		 Check-RemoteLogging
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '25' {
         'Block guest OS BPDU transmissions'
		 Check-BPDUTransmissions
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '26' {
         'Audit use of dvfilter network APIs'
		 Check-AuditdvFilter
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '27' {
         'Ensure hardware management controller interfaces are isolated on their own network segment and protected with perimeter access controls'
		 Check-NetworkIsolation
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '28' {
         'Ensure ESXi management interfaces are isolated on their own network segment'
		 Check-ManagementIsolation
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '29' {
         'Ensure vMotion interfaces are isolated on their own network segment and protected with perimeter access controls'
		 Check-vMotionIsolation
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '30' {
         'Ensure vSAN interfaces are isolated on their own network segment and protected with perimeter access controls'
		 Check-AuditOOB
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '31' {
         'Audit use of server hardware out-of-band management network interfaces'
		 Check-SwitchPolicy
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '32' {
         'Ensure that the “Forged Transmits” policy is set to reject on both the vSphere Standard Switch and on its port groups'
		 Check-SwitchPolicy
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '33' {
         'Ensure that the “MAC Address Changes” policy is set to reject on both the vSphere Standard Switch and on its port groups'
		 Check-SwitchPolicy
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '34' {
         'Ensure that the “Promiscuous Mode” policy is set to reject on both the vSphere Standard Switch and on its port groups'
		 Check-SwitchPolicy
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '35' {
         'Disable ESXi Shell'
		 Check-DisableShell
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '36' {
         'Set a timeout to automatically terminate idle ESXi Shell and SSH sessions'
		 Check-TimeoutShell
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '37' {
         'Set a timeout to limit how long the ESXi Shell and SSH services are allowed to run'
		 Check-TimeoutSSH
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '38' {
         'Warning for support and troubleshooting interfaces is suppressed'
		 Check-SuppressAlarms
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '39' {
         'ESXi is a version with active maintenance by VMware'
		 Check-ActiveMaintenance
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '40' {
         'Configure NTP or PTP'
		 Check-NTP-PTP
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '41' {
         'Ensure that deprecated SSL/TLS protocols are disabled'
		 Check-DepricatedProtocols
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '42' {
         'Restrict transparent page sharing to VMs configured with schedmempsharesalt'
		 Check-RestrictTPS
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '43' {
         'ESXi is up to date'
		 Check-ESXiUpdate
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '44' {
         'Verify Image Profile and VIB Acceptance Levels'
		 Check-Image-VIB
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
     '45' {
         'Only run binaries delivered via VIB'
		 Check-IntegrityChecks
	Write-Host -NoNewLine " Press any key to continue...";
	$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	clear
		 TRF-Choice-7x-SecurityGuide
     }
	 'Q' {
         'You chose to go back'
		 clear
		 TRF-Select-Cluster
     } 
  }
 }
 clear
 
 
 
 
#Automatically unlock a locked account after a specific amount of time.
function Check-AutoUnlock
{
	clear
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Security.AccountUnlockTime
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Security.AccountUnlockTime | export-csv -path "$global:FilePath\Check-AutoUnlock $(get-date -f yyyy-MM-dd-hhmm).csv"
}
 
#Set the count of maximum failed login attempts before the account is locked out.
function Check-LockCount
{
		clear
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Security.AccountLockFailures
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Security.AccountLockFailures | export-csv -path "$global:FilePath\Check-LockCount $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Do not permit password reuse.
function Check-PasswordReuse
{
	clear
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Security.PasswordHistory
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Security.PasswordHistory | export-csv -path "$global:FilePath\Check-PasswordReuse $(get-date -f yyyy-MM-dd-hhmm).csv"
} 

#Establish a policy for password complexity.
function Check-PasswordComplexity
{
	clear
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting -Name Security.PasswordQualityControl
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting -Name Security.PasswordQualityControl | export-csv -path "$global:FilePath\Check-PasswordComplexity $(get-date -f yyyy-MM-dd-hhmm).csv"
}  
 
#Use the Authentication Proxy to protect passwords during Active Directory domain joins.
function Check-UseAuthProxy
{
	clear
Get-Cluster $global:CLUChoice | Get-VMHost | Get-VMHostAuthentication | Select-Object VMHost,Domain,DomainMembershipStatus
Get-Cluster $global:CLUChoice | Get-VMHost | Get-VMHostAuthentication | Select-Object VMHost,Domain,DomainMembershipStatus | export-csv -path "$global:FilePath\Check-UseAuthProxy $(get-date -f yyyy-MM-dd-hhmm).csv"
}   
 
#Use Active Directory for ESXi user authentication.
function Check-UseADAuth
{
	clear
Get-Cluster $global:CLUChoice | Get-VMHost | Get-VMHostAuthentication | Select-Object VMHost,Domain,DomainMembershipStatus
Get-Cluster $global:CLUChoice | Get-VMHost | Get-VMHostAuthentication | Select-Object VMHost,Domain,DomainMembershipStatus | export-csv -path "$global:FilePath\Check-UseADAuth $(get-date -f yyyy-MM-dd-hhmm).csv"
}  
 
#Warning for potential hyperthreading security vulnerability is suppressed.
function Check-HTVulnSuppress
{
	clear
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting UserVars.SuppressHyperthreadWarning
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting UserVars.SuppressHyperthreadWarning | export-csv -path "$global:FilePath\Check-HTVulnSuppress $(get-date -f yyyy-MM-dd-hhmm).csv"
}  

#Set a timeout to automatically terminate idle DCUI sessions.
function Check-DCUITimeout
{
	clear
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting UserVars.DcuiTimeOut
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting UserVars.DcuiTimeOut | export-csv -path "$global:FilePath\Check-DCUITimeout $(get-date -f yyyy-MM-dd-hhmm).csv"
} 

#Configure or disable CIM.
function Check-CIM
{
	clear
Write-Host " CIM should be disabled if not in use" -ForegroundColor yellow
Write-Host
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'sfcbd-watchdog' -and $_.Running -eq 'True'}
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'sfcbd-watchdog' -and $_.Policy -eq 'On'}
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'sfcbd-watchdog' -and $_.Running -eq 'True'} | export-csv -path "$global:FilePath\Check-CIMRunning $(get-date -f yyyy-MM-dd-hhmm).csv"
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'sfcbd-watchdog' -and $_.Policy -eq 'On'} | export-csv -path "$global:FilePath\Check-CIMPolicy $(get-date -f yyyy-MM-dd-hhmm).csv"
} 

#Disable Managed Object Browser (MOB)
function Check-DisabledMOB
{
	clear
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Config.HostAgent.plugins.solo.enableMob
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Config.HostAgent.plugins.solo.enableMob | export-csv -path "$global:FilePath\Check-DisabledMOB $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Configure or disable SLP
function Check-DisabledSLP
{
	clear
Write-Host " SLP should be disabled if not in use." -ForegroundColor yellow
Write-Host
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'slpd' -and $_.Running -eq 'True'}
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'slpd' -and $_.Policy -eq 'On'}
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'slpd' -and $_.Running -eq 'True'} | export-csv -path "$global:FilePath\Check-SLPRunning $(get-date -f yyyy-MM-dd-hhmm).csv"
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'slpd' -and $_.Policy -eq 'On'} | export-csv -path "$global:FilePath\Check-SLPPolicy $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Configure or disable SNMP
function Check-DisabledSNMP
{
	clear
Write-Host " If SNMP is not being used it should be disabled." -ForegroundColor yellow
Write-Host
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'snmpd' -and $_.Running -eq 'True'}
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'snmpd' -and $_.Policy -eq 'On'}
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'snmpd' -and $_.Running -eq 'True'} | export-csv -path "$global:FilePath\Check-SNMPRunning $(get-date -f yyyy-MM-dd-hhmm).csv"
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'snmpd' -and $_.Policy -eq 'On'} | export-csv -path "$global:FilePath\Check-SNMPPolicy $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Disable SSH
function Check-DisabledSSH
{
	clear
Write-Host " ESXi is not a UNIX-like multiuser OS -- it is a purpose-built hypervisor intended to be managed via the Host Client, vSphere Client, and/or APIs. On ESXi, SSH is a troubleshooting and support interface, and is intentionally stopped and disabled by default. Enablement of the interface brings risk." -ForegroundColor yellow
Write-Host
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'TSM-SSH' -and $_.Running -eq 'True'}
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'TSM-SSH' -and $_.Policy -eq 'On'}
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'TSM-SSH' -and $_.Running -eq 'True'} | export-csv -path "$global:FilePath\Check-SSHRunning $(get-date -f yyyy-MM-dd-hhmm).csv"
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'TSM-SSH' -and $_.Policy -eq 'On'} | export-csv -path "$global:FilePath\Check-SSHPolicy $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Configure the ESXi firewall for additional defense-in-depth.
function Check-RestrictFW
{
	clear
Write-Host " Unrestricted access to services running on an ESXi host can expose a host to outside attacks and unauthorized access. Reduce the risk by configuring the ESXi firewall to only allow access from authorized networks as a defense-in-depth measure. Note: ensure that you add a rule permitting management of the hosts before you add a rule to deny all traffic!" -ForegroundColor yellow
Write-Host
Get-Cluster $global:CLUChoice | Get-VMHost  | Get-VMHostFirewallException | Where {$_.Enabled -and (-not $_.ExtensionData.AllowedHosts.AllIP)}
Get-Cluster $global:CLUChoice | Get-VMHost  | Get-VMHostFirewallException | Where {$_.Enabled -and ($_.ExtensionData.AllowedHosts.AllIP)}
Get-Cluster $global:CLUChoice | Get-VMHost  | Get-VMHostFirewallException | Where {$_.Enabled -and (-not $_.ExtensionData.AllowedHosts.AllIP)} | export-csv -path "$global:FilePath\Check-SSHRunning $(get-date -f yyyy-MM-dd-hhmm).csv"
Get-Cluster $global:CLUChoice | Get-VMHost  | Get-VMHostFirewallException | Where {$_.Enabled -and ($_.ExtensionData.AllowedHosts.AllIP)} | export-csv -path "$global:FilePath\Check-SSHPolicy $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Enable UEFI Secure Boot.
function Check-SecureBoot
{
	clear
write-host
write-host " Enable UEFI Secure Boot." -ForegroundColor yellow
write-host 
write-host " Manual check required, see notes below" -ForegroundColor red
write-host
Write-Host " Enabling UEFI Secure Boot on the ESXi host's hardware helps prevent malware and untrusted configurations." -ForegroundColor yellow
write-host
Write-Host " Use '/usr/lib/vmware/secureboot/bin/secureBoot.py -s' on an example host to determine if Secure Boot is enabled." -ForegroundColor yellow
}



#Ensure that a TPM 2.0 is installed and enabled on the host.
function Check-TPM20
{
	clear
	write-host
write-host " Ensure that a TPM 2.0 is installed and enabled on the host." -ForegroundColor yellow
write-host 
write-host " Manual check required, see notes below" -ForegroundColor red
write-host
Write-Host " ESXi can use Trusted Platform Modules (TPM) to enable advanced security features that prevent malware, remove dependencies, and secure hardware lifecycle operations. " -ForegroundColor yellow
write-host
Write-Host " We recommend all servers be configured with a TPM 2.0 and the TPM be enabled in the system firmware. " -ForegroundColor yellow
}

#Hardware firmware is up to date.
function Check-HostFW
{
	clear
	write-host
write-host " Check Hardware firmware is up to date." -ForegroundColor yellow
write-host 
write-host " Manual check required, see notes below" -ForegroundColor red
write-host
Write-Host " Hardware firmware is not immune to serious issues affecting confidentiality, integrity, or availability. " -ForegroundColor yellow
write-host
Write-Host " Ensure that the latest firmware updates are applied to all components of your systems. " -ForegroundColor yellow
}

#Enable bidirectional/mutual CHAP authentication for iSCSI traffic.
function Check-iSCSIChap
{
	clear
	write-host
	write-host " Check bidirectional/mutual CHAP authentication for iSCSI traffic." -ForegroundColor yellow
	write-host
Get-Cluster $global:CLUChoice | Get-VMHost | Get-VMHostHba | Where {$_.Type -eq "Iscsi"} | Select VMHost, Device, ChapType, @{N="CHAPName";E={$_.AuthenticationProperties.ChapName}}
Get-Cluster $global:CLUChoice | Get-VMHost | Get-VMHostHba | Where {$_.Type -eq "Iscsi"} | Select VMHost, Device, ChapType, @{N="CHAPName";E={$_.AuthenticationProperties.ChapName}} | export-csv -path "$global:FilePath\Check-iSCSIChap $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Set DCUI.Access to allow trusted users to override lockdown mode.
function Check-DCUIAccess
{
	clear
	write-host
	write-host " Lockdown mode disables direct host access requiring that admins manage hosts from vCenter Server.  However, if a host becomes isolated from vCenter Server, the admin is locked out and can no longer manage the host. If you are using normal lockdown mode, you can avoid becoming locked out of an ESXi host that is running in lockdown mode, by setting DCUI.Access to a list of highly trusted users who can override lockdown mode and access the DCUI. The DCUI is completely unavailable in strict lockdown mode, so this parameter has no effect." -ForegroundColor yellow
	write-host
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting DCUI.Access
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting DCUI.Access | export-csv -path "$global:FilePath\Check-DCUIAccess $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Audit the users on the Exception Users List.
function Check-ExceptionUsers
{
		clear
	write-host
	write-host " Users on the Lockdown Mode 'Exception Users' list do not lose their privileges when the host enters lockdown mode. Ensure entries on this list are valid and necessary." -ForegroundColor yellow
	write-host
(Get-View -Id (Get-Cluster $global:CLUChoice | Get-VMHost -Name * | Get-View).ConfigManager.HostAccessManager).QueryLockdownExceptions()
(Get-View -Id (Get-Cluster $global:CLUChoice | Get-VMHost -Name * | Get-View).ConfigManager.HostAccessManager).QueryLockdownExceptions() | export-csv -path "$global:FilePath\Check-ExceptionUsers $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Check normal lockdown mode to restrict access to ESXi.
function Check-LockdownMode
{
		clear
	write-host
	write-host " Enabling lockdown mode disables direct access to an ESXi host and requires that the host managed remotely from vCenter Server.  This is done to ensure the roles and access controls implemented in vCenter are always enforced and users cannot bypass them by logging into a host directly.   By forcing all interaction to occur through vCenter Server, the risk of someone inadvertently attaining elevated privileges or performing tasks that are not properly audited is greatly reduced.  Note:  Lockdown mode does not apply to  users who log in using authorized keys. When you use an authorized key file for root user authentication, root users are not prevented from accessing a host with SSH even when the host is in lockdown mode.  Note that users listed in the DCUI.Access list for each host are allowed to override lockdown mode and login to the DCUI.   By default the "root" user is the only user listed in the DCUI.Access list. There are three settings for lockdown mode: disabled, normal, and strict. The choice of strict means that if the ESXi host loses contact with vCenter Server it cannot be managed in any way until that connection is restored. If that connection cannot be restored the host will need to be rebuilt. This is beyond the needs of most deployments. As such, we recommend normal lockdown mode." -ForegroundColor yellow
	write-host
(Get-Cluster $global:CLUChoice | Get-VMHost -Name * | Get-View).Config.LockdownMode
(Get-Cluster $global:CLUChoice | Get-VMHost -Name * | Get-View).Config.LockdownMode | export-csv -path "$global:FilePath\Check-LockdownMode $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Set the logging informational level.
function Check-LoggingLevel
{
		clear
	write-host
	write-host " It is important to ensure that enough information is present in audit logs for diagnostics and forensics." -ForegroundColor yellow
	write-host
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Config.HostAgent.log.level
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Config.HostAgent.log.level | export-csv -path "$global:FilePath\Check-LoggingLevel $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Configure persistent logging.
function Check-PersistentLogging
{
		clear
	write-host
	write-host " ESXi can be configured to store log files on an in-memory file system.  This occurs when the host's "/scratch" directory is linked to "/tmp/scratch". When this is done only a single day's worth of logs are stored at any time. In addition log files will be reinitialized upon each reboot.  This presents a security risk as user activity logged on the host is only stored temporarily and will not persistent across reboots.  This can also complicate auditing and make it harder to monitor events and diagnose issues.  ESXi host logging should always be configured to a persistent datastore." -ForegroundColor yellow
	write-host
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Syslog.global.logDir
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Syslog.global.logDir | export-csv -path "$global:FilePath\Check-PersistentLogging $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Configure remote logging.
function Check-RemoteLogging
{
		clear
	write-host
	write-host " Remote logging to a central log host provides a secure, centralized store for ESXi logs. By gathering host log files onto a central host you can more easily monitor all hosts with a single tool. You can also do aggregate analysis and searching to look for such things as coordinated attacks on multiple hosts. Logging to a secure, centralized log server helps prevent log tampering and also provides a long-term audit record." -ForegroundColor yellow
	write-host
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Syslog.global.logHost 
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Syslog.global.logHost | export-csv -path "$global:FilePath\Check-RemoteLogging $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Block guest OS BPDU transmissions.
function Check-BPDUTransmissions
{
		clear
	write-host
	write-host " BPDU Guard and Portfast are commonly enabled on the physical switch to which the ESXi host is directly connected to reduce the spanning tree convergence delay. " -ForegroundColor yellow
	write-host
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Net.BlockGuestBPDU 
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Net.BlockGuestBPDU | export-csv -path "$global:FilePath\Check-BPDUTransmissions $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Audit use of dvfilter network APIs.
function Check-AuditdvFilter
{
		clear
	write-host
	write-host " If you are not using a product such as VMware NSX that make use of the dvfilter network API, the host should not be configured to send network information to a IP Address. If the API is enabled and the system running at the IP address referenced is compromised then there is potential for that system to provide unauthorized access to the network of other VMs on the host.  If you are using a product that makes use of this API then verify that the host has been configured correctly. " -ForegroundColor yellow
	write-host
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Net.DVFilterBindIpAddress
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Net.DVFilterBindIpAddress | export-csv -path "$global:FilePath\Check-AuditdvFilter $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Ensure hardware management controller interfaces are isolated on their own network segment and protected with perimeter access controls.
function Check-NetworkIsolation
{
		clear
	write-host
write-host " Ensure hardware management controller interfaces are isolated on their own network segment and protected with perimeter access controls." -ForegroundColor yellow
write-host 
write-host " Manual check required, see notes below" -ForegroundColor red
write-host
Write-Host " Ensure that all out-of-band hardware management interfaces are on a network segment (VLAN, etc.) dedicated only to hardware management, free of workloads and unrelated systems, and controlled with perimeter security controls such that only authorized vSphere Administrators can access those interfaces from authorized workstations. " -ForegroundColor yellow
write-host
}

#Ensure ESXi management interfaces are isolated on their own network segment.
function Check-ManagementIsolation
{
		clear
	write-host
write-host " Ensure ESXi management interfaces are isolated on their own network segment." -ForegroundColor yellow
write-host 
write-host " Manual check required, see notes below" -ForegroundColor red
write-host
Write-Host " Ensure that all VMkernel interfaces configured for ESXi management are on a network segment (VLAN, etc.) dedicated only to virtualization management, free of workloads and unrelated systems, and controlled with perimeter security controls such that only authorized vSphere Administrators can access those interfaces from authorized workstations. " -ForegroundColor yellow
write-host
}

#Ensure vMotion interfaces are isolated on their own network segment and protected with perimeter access controls.
function Check-vMotionIsolation
{
		clear
	write-host
write-host " Ensure vMotion interfaces are isolated on their own network segment and protected with perimeter access controls." -ForegroundColor yellow
write-host 
write-host " Manual check required, see notes below" -ForegroundColor red
write-host
Write-Host " Ensure that all VMkernel interfaces configured for vMotion are on a network segment (VLAN, etc.) dedicated only to vMotion, free of workloads and unrelated systems, and controlled with perimeter security controls such that only other clustered ESXi hosts have access. " -ForegroundColor yellow
write-host
}

#Audit use of server hardware out-of-band management network interfaces.
function Check-AuditOOB
{
		clear
	write-host
write-host " Audit use of server hardware out-of-band management network interfaces." -ForegroundColor yellow
write-host 
write-host " Manual check required, see notes below" -ForegroundColor red
write-host
Write-Host " Some hardware management controllers have the ability to present virtual network interfaces to ESXi as a management interface. These approaches create backdoors for access and can be used by adversaries to circumvent network-based/perimeter firewalls and IDS/IPS tools, as well as gain access to system consoles. Only enable this and other hardware management functionality and tools if there is a clear return on the investment of time and effort in maintaining and securing these tools. " -ForegroundColor yellow
write-host
}

#Ensure that the “Forged Transmits” policy is set to reject on both the vSphere Standard Switch and on its port groups.
function Check-SwitchPolicy
{
		clear
	write-host
Write-Host " If the virtual machine operating system changes the MAC address, the operating system can send frames with an impersonated source MAC address at any time. This allows an operating system to stage malicious attacks on the devices in a network by impersonating a network adaptor authorized by the receiving network.  " -ForegroundColor yellow
Write-Host
Write-Host " When the Forged transmits option is set to Accept, ESXi does not compare source and effective MAC addresses. " -ForegroundColor yellow
Write-Host
Write-Host " To protect against MAC impersonation, you can set the Forged transmits option to Reject. If you do, the host compares the source MAC address being transmitted by the guest operating system with the effective MAC address for its virtual machine adapter to see if they match. If the addresses do not match, the ESXi host drops the packet. " -ForegroundColor yellow
Write-Host
Get-Cluster $global:CLUChoice | Get-VirtualSwitch | Get-SecurityPolicy
Get-Cluster $global:CLUChoice | Get-VirtualPortGroup | Get-SecurityPolicy
Get-Cluster $global:CLUChoice | Get-VirtualSwitch | Get-SecurityPolicy | export-csv -path "$global:FilePath\Check-RestrictFW $(get-date -f yyyy-MM-dd-hhmm).csv"
Get-Cluster $global:CLUChoice | Get-VirtualPortGroup | Get-SecurityPolicy | export-csv -path "$global:FilePath\Check-RestrictFW $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Disable ESXi Shell.
function Check-DisableShell
{
		clear
	write-host
Write-Host " ESXi is not a UNIX-like multiuser OS -- it is a purpose-built hypervisor intended to be managed via the Host Client, vSphere Client, and/or APIs. On ESXi, the ESXi Shell is a troubleshooting and support interface, and is intentionally stopped and disabled by default. Enablement of the interface brings risk.  " -ForegroundColor yellow
Write-Host
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'TSM' -and $_.Running -eq 'True'}
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'TSM' -and $_.Policy -eq 'On'}
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'TSM' -and $_.Running -eq 'True'} | export-csv -path "$global:FilePath\Check-DisableShellRun $(get-date -f yyyy-MM-dd-hhmm).csv"
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'TSM' -and $_.Policy -eq 'On'} | export-csv -path "$global:FilePath\Check-DisableShellPolicy $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Set a timeout to automatically terminate idle ESXi Shell and SSH sessions.
function Check-TimeoutShell
{
		clear
	write-host
Write-Host " If a user forgets to log out of their SSH session, the idle connection will remains open indefinitely, increasing the potential for someone to gain privileged access to the host.  The ESXiShellInteractiveTimeOut allows you to automatically terminate idle shell sessions.  " -ForegroundColor yellow
Write-Host
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting UserVars.ESXiShellInteractiveTimeOut
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting UserVars.ESXiShellInteractiveTimeOut | export-csv -path "$global:FilePath\Check-TimeoutShell $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Set a timeout to limit how long the ESXi Shell and SSH services are allowed to run.
function Check-TimeoutSSH
{
		clear
	write-host
Write-Host " When the ESXi Shell or SSH services are enabled on a host they will run indefinitely.  To avoid having these services left running set the ESXiShellTimeOut.  The ESXiShellTimeOut defines a window of time after which the ESXi Shell and SSH services will automatically be terminated.  " -ForegroundColor yellow
Write-Host
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting UserVars.ESXiShellTimeOut
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting UserVars.ESXiShellTimeOut | export-csv -path "$global:FilePath\Check-TimeoutSSH $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Warning for support and troubleshooting interfaces is suppressed.
function Check-SuppressAlarms
{
		clear
	write-host
Write-Host " SSH and the ESXi Shell are troubleshooting and support interfaces, and are intentionally stopped and disabled by default. Enablement of those interfaces brings risk. Dismissal of the warning masks potential risk present. " -ForegroundColor yellow
Write-Host
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting UserVars.SuppressShellWarning
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting UserVars.SuppressShellWarning | export-csv -path "$global:FilePath\Check-SuppressAlarms $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#ESXi is a version with active maintenance by VMware.
function Check-ActiveMaintenance
{
		clear
	write-host
Write-Host " Ensure that ESXi is of a version that has not reached End of General Support status. " -ForegroundColor yellow
Write-Host
Get-Cluster $global:CLUChoice | Get-VMHost | Select-Object Name,Version,Build
Get-Cluster $global:CLUChoice | Get-VMHost | Select-Object Name,Version,Build | export-csv -path "$global:FilePath\Check-ActiveMaintenance $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Configure NTP or PTP.
function Check-NTP-PTP
{
		clear
	write-host
Write-Host " Cryptography, audit logging, cluster operations, and incident response/forensics depend deeply on synchronized time. The recommendation for NTP is to have at least four sources. Do not have two sources (one source is preferable to two). " -ForegroundColor yellow
Write-Host
Get-Cluster $global:CLUChoice | Get-VMHost | Select Name, @{N="NTPSetting";E={$_ | Get-VMHostNtpServer}}
Get-Cluster $global:CLUChoice | Get-VMHost | Select Name, @{N="NTPSetting";E={$_ | Get-VMHostNtpServer}} | export-csv -path "$global:FilePath\Check-NTP $(get-date -f yyyy-MM-dd-hhmm).csv"
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'ntpd'}
Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'ntpd'} | export-csv -path "$global:FilePath\Check-ntpd $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Ensure that deprecated SSL/TLS protocols are disabled.
function Check-DepricatedProtocols
{
		clear
	write-host
Write-Host " ESXi 7 ships with TLS 1.2 enabled. " -ForegroundColor yellow
Write-Host
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting UserVars.ESXiVPsDisabledProtocols
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting UserVars.ESXiVPsDisabledProtocols | export-csv -path "$global:FilePath\Check-DepricatedProtocols $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Restrict transparent page sharing to VMs configured with sched.mem.pshare.salt.
function Check-RestrictTPS
{
		clear
	write-host
Write-Host " Transparent Page Sharing (TPS) is a method to reduce the memory footprint of virtual machines. Under highly controlled conditions it can be used to gain unauthorized access to data on neighboring virtual machines. " -ForegroundColor yellow
Write-Host
Write-Host " VMs that do not have the sched.mem.pshare.salt option set cannot share memory with any other VMs." -ForegroundColor yellow
Write-Host
Write-Host " Large page sizes, a performance optimization in the hypervisor on many modern CPUs, is incompatible with TPS. " -ForegroundColor yellow
Write-Host
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Mem.ShareForceSalting
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting Mem.ShareForceSalting | export-csv -path "$global:FilePath\Check-RestrictTPS $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#ESXi is up to date.
function Check-ESXiUpdate
{
		clear
	write-host
Write-Host " By staying up to date on ESXi patches, vulnerabilities in the hypervisor can be mitigated. An educated attacker can exploit known vulnerabilities when attempting to attain access or elevate privileges on an ESXi host. " -ForegroundColor yellow
Write-Host
Write-Host " Always update vCenter Server first, if an update is available, then ESXi." -ForegroundColor yellow
Write-Host
Get-Cluster $global:CLUChoice | Get-VMHost | Select-Object Name,Version,Build
Get-Cluster $global:CLUChoice | Get-VMHost | Select-Object Name,Version,Build | export-csv -path "$global:FilePath\Check-ESXiUpdate $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Verify Image Profile and VIB Acceptance Levels.
function Check-Image-VIB
{
		clear
	write-host
Write-Host " The acceptance level controls what ESXi permits to be installed. There are four levels: VMwareCertified, VMwareAccepted, PartnerSupported, and CommunitySupported . " -ForegroundColor yellow
Write-Host
Write-Host " CommunitySupported VIBs have not been tested by VMware or a VMware partner and do not contain a digital signature. These are dangerous." -ForegroundColor yellow
Write-Host
Foreach ($VMHost in Get-Cluster $global:CLUChoice | Get-VMHost ) { $ESXCli = Get-EsxCli -VMHost $VMHost $VMHost | Select Name, @{N="AcceptanceLevel";E={$ESXCli.software.acceptance.get()}}}
#Foreach ($VMHost in Get-Cluster $global:CLUChoice | Get-VMHost ) { $ESXCli = Get-EsxCli -VMHost $VMHost $VMHost | Select Name, @{N="AcceptanceLevel";E={$ESXCli.software.acceptance.get()}}} | export-csv -path "$global:FilePath\Check-Image-VIB $(get-date -f yyyy-MM-dd-hhmm).csv"
Foreach ($VMHost in Get-Cluster $global:CLUChoice | Get-VMHost ) { $ESXCli = Get-EsxCli -VMHost $VMHost $ESXCli.software.vib.list() | Where { ($_.AcceptanceLevel -ne "VMwareCertified") -and ($_.AcceptanceLevel -ne "VMwareAccepted") -and ($_.AcceptanceLevel -ne "PartnerSupported") }}
#Foreach ($VMHost in Get-Cluster $global:CLUChoice | Get-VMHost ) { $ESXCli = Get-EsxCli -VMHost $VMHost $ESXCli.software.vib.list() | Where { ($_.AcceptanceLevel -ne "VMwareCertified") -and ($_.AcceptanceLevel -ne "VMwareAccepted") -and ($_.AcceptanceLevel -ne "PartnerSupported") }} | export-csv -path "$global:FilePath\Check-PartnerSupported $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#Only run binaries delivered via VIB.
function Check-IntegrityChecks
{
		clear
	write-host
Write-Host " ESXi conducts integrity checks of 'vSphere Installable Bundles' or VIBs, governed by the Acceptance Level (see below). Instructing ESXi to only execute binaries that originated from a valid VIB installed on the host makes it harder for attackers to use prebuilt toolkits during a compromise, and increases chances of detection. " -ForegroundColor yellow
Write-Host
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting VMkernel.Boot.execInstalledOnly
Get-Cluster $global:CLUChoice | Get-VMHost | Get-AdvancedSetting VMkernel.Boot.execInstalledOnly | export-csv -path "$global:FilePath\Check-IntegrityChecks $(get-date -f yyyy-MM-dd-hhmm).csv"
}

#########################################################################################
#########################################################################################
#########################################################################################
#########################################################################################

write-host " Please enter a file path for exports" -ForegroundColor yellow
	$Global:FilePath = Read-Host " location" 
clear
TRF-Select-Cluster