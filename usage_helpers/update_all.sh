#!/usr/bin/env bash

# Update all hosts managed by Mysql Roles
# run like ./update_all.sh RBAC
# to update all hosts managed by RBAC
mysql -h $1 _MysqlRoles -ss -e "SELECT distinct(Address) from host;" | while read host; do
  echo Trying to update $host using _MysqlRoles schema on $1
  python -m MysqlRoles $1 $host
done
