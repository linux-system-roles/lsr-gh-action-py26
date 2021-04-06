#!/bin/bash -l

set -euxo pipefail

exec 2>&1

yum -y install epel-release libffi-devel openssl-devel dbus-devel python-devel gcc git
yum -y install python-pip python34
if [ -n "${LSR_EXTRA_PACKAGES_YUM:-}" ]; then
  yum install -y $LSR_EXTRA_PACKAGES_YUM
fi
# pip install fails without this
mkdir -p $HOME/.cache/pip/http
# yum install python-pip brings in a very old version of setuptools - upgrade it first
pip install --upgrade 'setuptools==28.8.*'
pip install 'tox<3' 'virtualenv==15.*' 'pluggy==0.5.*' 'py<1.5' 'configparser<5' "$TOX_LSR"
tox -e "${LSR_GHA_PY26_TESTENV:-py26,coveralls,custom}"
