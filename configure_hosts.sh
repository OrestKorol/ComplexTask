#!/bin/bash
ip=`terraform output -raw sql_ip` ; echo -en "\n[mysql]\n$ip" >> Ansible/hosts
ip=`terraform output -raw tomcat_ip` ; echo -en "\n[tomcat]\n$ip" >> Ansible/hosts