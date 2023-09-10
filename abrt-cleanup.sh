#!/bin/bash
#
# https://unix.stackexchange.com/questions/556307/what-is-the-right-approach-to-purge-var-spool-abrt
set -e
function cleanup()
{
    systemctl start abrtd
    systemctl start abrt-oops
}

trap cleanup EXIT

systemctl stop abrtd
systemctl stop abrt-oops
find /var/spool/abrt/ -type d -ctime +10 -exec abrt-cli rm {} \;
cleanup
