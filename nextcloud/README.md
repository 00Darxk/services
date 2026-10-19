# Setup

Edit the file `nextcloud/config/config.php` to allow Tailscale to run as proxy, by inserting/editing the following values:
```php
'trusted_proxies' => ['${TS_IP}'],
'trusted_domains' => ['${TS_CERT_DOMAIN}'],
'overwritehost' => '${TS_CERT_DOMAIN}',
'overwriteprotocol' => 'https',
'overwrite.cli.url' => 'https://${TS_CERT_DOMAIN}',
```
Use the TS sidecar actual values for `$TS_IP` and `$TS_CERT_DOMAIN`

>
> need to bind `/data:/var/www/html/data` with media servers change
