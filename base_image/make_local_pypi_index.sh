#! /bin/bash

mkdir /var/cache/lsr-python-packages
cd /var/cache/lsr-python-packages

wget="curl -O"

# for tox
${wget} https://files.pythonhosted.org/packages/1d/4e/20c679f8c5948f7c48591fde33d442e716af66a31a88f5791850a75041eb/tox-2.9.1-py2.py3-none-any.whl
${wget} https://files.pythonhosted.org/packages/1d/c7/edad005b9fcc59f299a05394980ca76a376254d8dbcab639bb3e2e989807/setuptools-28.8.1-py2.py3-none-any.whl
${wget} https://files.pythonhosted.org/packages/82/05/43e3947125a2137cba4746135c75934ceed1863f27e050fc560052104a71/pluggy-0.6.0-py2-none-any.whl
${wget} https://files.pythonhosted.org/packages/53/67/9620edf7803ab867b175e4fd23c7b8bd8eba11cb761514dcd2e726ef07da/py-1.4.34-py2.py3-none-any.whl
${wget} https://files.pythonhosted.org/packages/7a/2a/95ed0501cf5d8709490b1d3a3f9b5cf340da6c433f896bbe9ce08dbe6785/configparser-4.0.2-py2.py3-none-any.whl
${wget} https://files.pythonhosted.org/packages/ed/ea/e20b5cbebf45d3096e8138ab74eda139595d827677f38e9dd543e6015bdf/virtualenv-15.2.0-py2.py3-none-any.whl
${wget} https://files.pythonhosted.org/packages/f2/94/3af39d34be01a24a6e65433d19e107099374224905f1e0cc6bbe1fd22a2f/argparse-1.4.0-py2.py3-none-any.whl
${wget} https://files.pythonhosted.org/packages/67/4b/141a581104b1f6397bfa78ac9d43d8ad29a7ca43ea90a2d863fe3056e86a/six-1.11.0-py2.py3-none-any.whl

# for pytest
${wget} https://files.pythonhosted.org/packages/3a/9a/9d878f8d885706e2530402de6417141129a943802c084238914fa6798d97/atomicwrites-1.2.1-py2.py3-none-any.whl
${wget} https://files.pythonhosted.org/packages/1f/9e/797b1b3e1faef3d62560ec55b1bf16311eeb54baf7d7ea64a1d7508824e5/attrs-16.0.0-py2.py3-none-any.whl
${wget} https://files.pythonhosted.org/packages/0b/e1/190ef1a264144c9b073b7353c259ca5431b5ddc8861b452e858fcbd0e9de/coverage-4.4.2.tar.gz
${wget} https://files.pythonhosted.org/packages/c5/db/e56e6b4bbac7c4a06de1c50de6fe1ef3810018ae11732a50f15f62c7d050/enum34-1.1.6-py2-none-any.whl
${wget} https://files.pythonhosted.org/packages/69/cb/f5be453359271714c01b9bd06126eaf2e368f1fddfff30818754b5ac2328/funcsigs-1.0.2-py2.py3-none-any.whl
${wget} https://files.pythonhosted.org/packages/ff/ee/57ca2b52dea2df65a15d4ab2669c89ff29fa227668917cebc43e689360be/idna-2.1-py2-none-any.whl
${wget} https://files.pythonhosted.org/packages/c2/f8/49697181b1651d8347d24c095ce46c7346c37335ddc7d255833e7cde674d/ipaddress-1.0.23-py2.py3-none-any.whl
${wget} https://files.pythonhosted.org/packages/e6/35/f187bdf23be87092bd0f1200d43d23076cee4d0dec109f195173fd3ebc79/mock-2.0.0-py2.py3-none-any.whl
${wget} https://files.pythonhosted.org/packages/fb/d3/77f337876600747ae307ea775ff264c5304a691941cd347382c7932c60ad/more_itertools-4.3.0-py2-none-any.whl
${wget} https://files.pythonhosted.org/packages/53/25/ef88e8e45db141faa9598fbf7ad0062df8f50f881a36ed6a0073e1572126/ordereddict-1.1.tar.gz
${wget} https://files.pythonhosted.org/packages/a4/ec/cf874077622c302317753c06f6cbead4ed9fb9db0aff73268d67301d6250/pathlib2-2.2.1-py2.py3-none-any.whl
${wget} https://files.pythonhosted.org/packages/0c/5d/b077dbf309993d52c1d71e6bf6fe443a8029ea215135ebbe0b1b10e7aefc/pbr-3.1.1-py2.py3-none-any.whl
${wget} https://files.pythonhosted.org/packages/fd/3e/d326a05d083481746a769fc051ae8d25f574ef140ad4fe7f809a2b63c0f0/pytest-3.1.3-py2.py3-none-any.whl
${wget} https://files.pythonhosted.org/packages/30/7d/7f6a78ae44a1248ee28cc777586c18b28a1df903470e5d34a6e25712b8aa/pytest_cov-2.5.1-py2.py3-none-any.whl
${wget} https://files.pythonhosted.org/packages/df/f5/9c052db7bd54d0cbf1bc0bb6554362bba1012d03e5888950a4f5c5dadc4e/scandir-1.10.0.tar.gz

# used to create the index
${wget} https://files.pythonhosted.org/packages/90/4e/09828ae76a686bbca3ea5dcacee98d3f2a5a264275b93f531c8fa1d71d2d/pip2pi-0.7.0-py2.py3-none-any.whl

pip install pip2pi-0.7.0-py2.py3-none-any.whl

# pip2pi in the local index is causing problems, therefore remove it before building the local index
rm pip2pi-0.7.0-py2.py3-none-any.whl
pip2pi /local_pypi_index *
rm -rf /var/cache/lsr-python-packages
