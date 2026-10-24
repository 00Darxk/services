# Setup

Edit the file `nextcloud/config/config.php` to allow Tailscale to run as proxy, by inserting/editing the following values:
```php
'trusted_proxies' => ['${TS_IP}'],
'trusted_domains' => ['${TS_CERT_DOMAIN}'],
'overwritehost' => '${TS_CERT_DOMAIN}',
'overwriteprotocol' => 'https',
'overwrite.cli.url' => 'https://${TS_CERT_DOMAIN}',
```
Use the Nextcloud TS sidecar actual values for `$TS_IP` and `$TS_CERT_DOMAIN`

Add the following to allow connecting to OnlyOffice through Tailscale:
```php
'onlyoffice' => [
    'allow_local_address' => true,
],
```


Generate the `HP_SHARED_KEY` use any password generator, for `JWT_SECRET` you can use `openssl rand -hex 32`
