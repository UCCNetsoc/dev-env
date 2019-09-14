FROM osixia/openldap:1.2.4

ENV LDAP_ADMIN_PASSWORD=netsoc
ENV LDAP_CONFIG_PASSWORD=netsoc
ENV LDAP_DOMAIN=netsoc.co
ENV LDAP_TLS=false
ENV LDAP_REPLICATION=false

EXPOSE 389

VOLUME [ "/var/lib/ldap", "/etc/ldap/slapd.d" ]

COPY ./data/config /etc/ldap/slapd.d
COPY ./data/database /var/lib/ldap