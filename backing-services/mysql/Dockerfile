FROM mysql:8.0.18

ENV MYSQL_USER=pterodactyl
ENV MYSQL_PASSWORD=password
ENV MYSQL_DATABASE=panel
ENV MYSQL_ROOT_PASSWORD=password

EXPOSE 3306

VOLUME [ "/var/lib/mysql" ]

COPY ./data /docker-entrypoint-initdb.d

CMD [ "mysqld", "--default-authentication-plugin=mysql_native_password" ]
