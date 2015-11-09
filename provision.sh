#!/bin/bash
 
# reference
# http://www.moyashi-koubou.com/blog/vagrant_ansible_windows/

ANSIBLE_PLAYBOOK=${1}
ANSIBLE_HOSTS=${2}
TEMP_HOSTS="/tmp/ansible_hosts"
 
if [ ! -f /vagrant/$ANSIBLE_PLAYBOOK ]; then
  echo "Cannot find Ansible playbook"
  exit 1
fi
 
if [ ! -f /vagrant/$ANSIBLE_HOSTS ]; then
  echo "Cannot find Ansible hosts"
  exit 2
fi
 
if ! [ `which wget` ]; then
  sudo yum install -y wget
fi
if ! [ `which rsync` ]; then
  sudo yum install -y rsync
fi
if ! [ `which bzip2` ]; then
  sudo yum install -y bzip2
fi
if ! [ `which ansible` ]; then
  wget http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7
  sudo rpm --import RPM-GPG-KEY-EPEL-7
  wget http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
  sudo rpm -ivh epel-release-7-5.noarch.rpm
  sudo yum install -y ansible
fi
 
cp /vagrant/${ANSIBLE_HOSTS} ${TEMP_HOSTS} && chmod -x ${TEMP_HOSTS}
echo "Running Ansible"
bash -c "ansible-playbook /vagrant/${ANSIBLE_PLAYBOOK} --inventory-file=${TEMP_HOSTS} --connection=local"
rm ${TEMP_HOSTS}
