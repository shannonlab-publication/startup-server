#!/bin/sh

#WorkingDirectory
WORK_DIR=/usr/local/work

function passwd_root() {
  echo "管理者パスワードを変更してください。必ずメモしてください。忘れた場合は復旧できません。"
  passwd
}

function adduser_develop() {
  echo "開発者用アカウント(dev)を追加します。パスワードを変更してください。必ずメモしてください。"
  adduser dev
  id dev
  passwd dev
}

function chef_install() {

  mkdir $WORK_DIR
  cd $WORK_DIR
  wget https://packages.chef.io/stable/el/6/chef-12.12.15-1.el6.x86_64.rpm
  rpm -ivh chef-12.12.15-1.el6.x86_64.rpm
  RESULT=`rpm -qa | grep chef`

  if [ -n "$RESULT" ]; then
    echo "CHEF INSTALL SUCCES"
    mkdir /var/chef
  fi

}


passwd_root
adduser_develop
chef_install
