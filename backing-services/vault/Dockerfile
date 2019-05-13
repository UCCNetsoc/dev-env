FROM vault:1.1.2

COPY ./data/config.hcl /vault/config/config.hcl
COPY ./data/init.sh /init.sh
COPY ./data/admin-policy.hcl /admin-policy.hcl

RUN chmod 777 /init.sh

RUN apk add curl

ENTRYPOINT [ "/init.sh" ]