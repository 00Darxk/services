$PSNativeCommandArgumentPassing = 'Legacy'
msiexec /i windows_exporter-0.31.8-amd64.msi --% ADDLOCAL=FirewallException REMOTE_ADDR="__REMOTE_ADDR__" ENABLED_COLLECTORS="cache,cpu,container,diskdrive,gpu,hyperv,iis,logical_disk,memory,netframework,net,os,pagefile,physical_disk,process,scheduled_task,service,tcp,time,udp,update,vmware" EXTRA_FLAGS="--web.listen-address=__LISTEN_ADDR__:9182"
