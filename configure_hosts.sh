#!/bin/bash
ip=`terraform output sql_ip` ; echo -en "[mysql]\n $ip ansible_ssh_user=ec2-user" >> Ansible/hosts
ip=`terraform output tomcat_ip` ; echo -en "\n[tomcat]\n $ip ansible_ssh_user=ec2-user" >> Ansible/hosts