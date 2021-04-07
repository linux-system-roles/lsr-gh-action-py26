#!/bin/bash -l

set -euxo pipefail

exec 2>&1

setuptools='setuptools==28.8.*'
setuptools_whl='https://files.pythonhosted.org/packages/1d/c7/edad005b9fcc59f299a05394980ca76a376254d8dbcab639bb3e2e989807/setuptools-28.8.1-py2.py3-none-any.whl'
install_setuptools() {
  rc=1
  for ii in $(seq 1 5); do
    if pip install --upgrade "$setuptools"; then
      rc=0
      break
    else
      # there is quite a common, annoying error:
      # No matching distribution found for setuptools==28.8.*
      sleep 1
      if pip install --upgrade "$setuptools_whl"; then
        rc=0
        break
      else
        sleep 1
      fi
    fi
  done
  if [ "$rc" = 1 ]; then
    echo Error: could not install setuptools after several retries
  fi
  return "$rc"
}

yum -y install epel-release libffi-devel openssl-devel dbus-devel python-devel gcc git
yum -y install python-pip python34
if [ -n "${LSR_EXTRA_PACKAGES_YUM:-}" ]; then
  yum install -y $LSR_EXTRA_PACKAGES_YUM
fi
# pip install fails without this
mkdir -p $HOME/.cache/pip/http
# yum install python-pip brings in a very old version of setuptools - upgrade it first
install_setuptools
pip install 'tox<3' 'virtualenv==15.*' 'pluggy==0.5.*' 'py<1.5' 'configparser<5' "$TOX_LSR"
tox -e "${LSR_GHA_PY26_TESTENV:-py26,coveralls,custom}"
