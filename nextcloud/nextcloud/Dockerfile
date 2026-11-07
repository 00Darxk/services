ARG TAG
FROM nextcloud:${TAG}

# Listen to localhost only
RUN sed -i 's|Listen 80|Listen 127.0.0.1:80|g' /etc/apache2/ports.conf

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
