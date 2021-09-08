$GlobalTLSsettings = @()

$creds = get-credential

foreach ($vCenter in (Get-Content C:\Users\test\Desktop\missing.txt|sort -unique)) {

                if ($global:DefaultVIServers) {Disconnect-VIServer * -Force -Confirm:0}
                $vcenter_retry_count = 0
                while ($global:DefaultVIServer.name -notmatch $vcenter) {
                
        Write-host "Connecting to $vcenter" -ForegroundColor Yellow
        Connect-VIServer $vCenter -credential $creds
        
                                $vcenter_retry_count++

                               
                                if ($vcenter_retry_count -eq 2) {break}
                }

                if ($global:DefaultVIServer) {

                                $all_vmhosts = Get-VMHost
                                foreach ($all_vmhost in $all_vmhosts) {

                                                $EsxTLSsettings = "" | select vCenter, ESX, DisabledProtocols
                                                $EsxTLSsettings.vCenter = $global:DefaultVIServer.name
                                                $EsxTLSsettings.ESX = $($all_vmhost.name)
                                                $EsxTLSsettings.DisabledProtocols = Get-AdvancedSetting -Entity $all_vmhost UserVars.ESXiVPsDisabledProtocols | Select -ExpandProperty Value
                                                $GlobalTLSsettings += $EsxTLSsettings

                                }
                }
}

$GlobalTLSsettings | sort vCenter | ConvertTo-Csv -NoTypeInformation | out-file  -force "D:\TLSReport\GlobalTLSsettings $(get-date -f yyyy-MM-dd-hhmm).csv"
