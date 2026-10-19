Change the `LISTEN_ADDR` and `REMOTE_ADDR` in (`start.ps1`)[./start.ps1], and run it in an administator shell. Make sure the firewall rule created has an allow action, or manually set it:

```ps1
Set-NetFirewallRule -DisplayName "A Prometheus exporter for Windows machines." -Action Allow
```
