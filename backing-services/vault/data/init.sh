#!/bin/sh

set -e

function setup {
    sleep 10

    vault auth enable ldap

    vault write auth/ldap/config \
        url="ldap://auth" \
        userattr="uid" \
        groupattr="gidNumber" \
        userdn="cn=admins,dc=netsoc,dc=co" \
        binddn="cn=admin,dc=netsoc,dc=co" \
        bindpass="netsoc" \
        groupfilter="(&(objectClass=account)(uid={{.Username}}))" \
        groupdn="cn=admins,dc=netsoc,dc=co" \
        starttls=false

    vault write auth/ldap/groups/admins policies=admins
    vault write auth/ldap/groups/420 policies=admins

    vault policy write admins /admin-policy.hcl
}

echo 'waiting for cluster to stabilize'

setup &

echo 'deregistering from cluster'

curl -v -X PUT consul:8500/v1/agent/service/deregister/vault:172.31.1.5:8200
curl -v -X DELETE consul:8500/v1/kv/netsoc/vault/?recurse=true

sleep 1

vault server -dev -config=/vault/config/config.hcl