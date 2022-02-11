#!/bin/bash -l

set -euxo pipefail

exec 2>&1

if [ -n "${LSR_EXTRA_PACKAGES_YUM:-}" ]; then
  yum install -y $LSR_EXTRA_PACKAGES_YUM
fi
# pip install fails without this
mkdir -p $HOME/.cache/pip/http
pip install "$TOX_LSR"
tox -e "${LSR_GHA_PY26_TESTENV:-py26,coveralls,custom}"
