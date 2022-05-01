#!/bin/bash

set -e

if [ $# != 0 ]
  then 
    echo 'Please pass a variable of the playbook you want to run. You can also, optionally, specifyc a specific server to limit the scope.'
elif [ $# = 1 ]
  then
    ansible-playbook -i ./inventory/hosts.yml -b -K ./playbooks/$1.yml
else
  ansible-playbook -i ./inventory/hosts.yml -b -K ./playbooks/$1.yml --limit $2
fi
