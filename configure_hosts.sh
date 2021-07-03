#!/bin/bash
ip=`terraform output -raw sql_ip` ; echo -en "\n[sqlNode]\n$ip ansible_ssh_user=ec2-user" >> Ansible/hosts
ip=`terraform output -raw tomcat_ip` ; echo -en "\n[tomcatNode]\n$ip ansible_ssh_user=ec2-user" >> Ansible/hosts