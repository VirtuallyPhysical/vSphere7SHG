param (
    [Parameter(Mandatory=$true)]
    [string] $vCenterListPath,

    [Parameter(Mandatory=$true)]
    [string] $outputPath
)

$creds = Get-Credential

Get-Content $vCenterListPath | Sort-Object -Unique | ForEach-Object {
    $vCenter = $_
    $connected = $false

    for ($retry = 0; $retry -lt 2; $retry++) {
        if ($global:DefaultVIServers) {
            Disconnect-VIServer * -Force -Confirm:0
        }

        try {
            Write-host "Connecting to $vCenter" -ForegroundColor Yellow
            Connect-VIServer $vCenter -credential $creds
            $connected = $true
            break
        }
        catch {
            Write-Host "Failed to connect to $vCenter: $_"
            Start-Sleep -Seconds 10
        }
    }

    if ($connected) {
        Get-VMHost | ForEach-Object {
            $all_vmhost = $_

            $EsxTLSsettings = "" | select vCenter, ESX, DisabledProtocols
            $EsxTLSsettings.vCenter = $global:DefaultVIServer.name
            $EsxTLSsettings.ESX = $($all_vmhost.name)
            $EsxTLSsettings.DisabledProtocols = Get-AdvancedSetting -Entity $all_vmhost UserVars.ESXiVPsDisabledProtocols | Select -ExpandProperty Value

            $EsxTLSsettings
        }
    }
} | Sort-Object vCenter | ConvertTo-Csv -NoTypeInformation | Out-File -Force "$outputPath\GlobalTLSsettings $(get-date -f yyyy-MM-dd-hhmm).csv"
