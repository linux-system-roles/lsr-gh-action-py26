# lsr-gh-action-py26
A GitHub Action to run python 2.6 tox tests for linux-system-roles

Requires the environment variable `TOX_LSR` to be set to the `tox-lsr` name or
URL to install via `pip`.  For example:

```yaml
env:
  TOX_LSR: "git+https://github.com/linux-system-roles/tox-lsr@2.5.0"
jobs:
  python-26:
    runs-on: ubuntu-latest
    steps:
      - name: checkout PR
        uses: actions/checkout@v2
      - name: Run LSR py26 action
        uses: "linux-system-roles/lsr-gh-action-py26@1.0.0"
```

This runs an EL6 container image.  If you need to install additional packages in
the container, use env `LSR_EXTRA_PACKAGES_YUM`:

```yaml
env:
  TOX_LSR: "git+https://github.com/linux-system-roles/tox-lsr@2.5.0"
  LSR_EXTRA_PACKAGES_YUM: "python34-netaddr python34-jmespath"
...
```

This runs the tox testenvs `py26,coveralls,custom` by default.  If you want to
change this, set env `LSR_GHA_PY26_TESTENV: sometest,someother,test`.
