$env:LISTEN_ADDR = $(tailscale ip -4)

$PSNativeCommandArgumentPassing = 'Legacy'
msiexec /i windows_exporter-0.31.8-amd64.msi --% LISTEN_ADDR=$env:LISTEN_ADDR ENABLED_COLLECTORS="cache,cpu,container,diskdrive,gpu,hyperv,iis,logical_disk,memory,netframework,net,os,pagefile,physical_disk,process,scheduled_task,service,tcp,time,udp,update,vmware"