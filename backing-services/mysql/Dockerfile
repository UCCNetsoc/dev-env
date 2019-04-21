FROM mysql:5.7.20

ENV MYSQL_USER=netsoc
ENV MYSQL_PASSWORD=netsoc
ENV MYSQL_DATABASE=netsoc_admin
ENV MYSQL_ROOT_PASSWORD=netsoc

EXPOSE 3306

VOLUME [ "/var/lib/mysql" ]

COPY init.sql /docker-entrypoint-initdb.d/

CMD [ "mysqld", "--default-authentication-plugin=mysql_native_password" ]