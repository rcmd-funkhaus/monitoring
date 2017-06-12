#!/usr/bin/env bash

source /etc/monit/plugins/okfail.sh

status=`curl -s -o /dev/null -w "%{http_code}" --connect-timeout 10 --max-time 10 $1`

if [[ $status == "200" ]]; then
    ok "Web-interface is OK"
else
    fail "Web-interface is down"
fi
