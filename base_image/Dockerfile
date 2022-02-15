FROM registry.centos.org/centos:6
RUN set -euo pipefail; \
    for file in /etc/yum.repos.d/CentOS-*.repo; do \
      if ! grep '^baseurl=.*vault[.]centos[.]org' "$file"; then \
        sed -i -e 's,^mirrorlist,#mirrorlist,' \
               -e 's,^#baseurl=,baseurl=,' \
               -e 's,mirror.centos.org/centos/$releasever,vault.centos.org/6.10,' \
               "$file"; \
      fi; \
    done
RUN yum -y install epel-release libffi-devel openssl-devel dbus-devel python-devel gcc git && \
    yum -y install python-pip python34 && \
    yum clean all

COPY make_local_pypi_index.sh /
RUN /make_local_pypi_index.sh

RUN pip install --upgrade --index-url=file:///local_pypi_index/simple setuptools
RUN pip install --index-url=file:///local_pypi_index/simple tox virtualenv pluggy py configparser argparse six
