## pyVim
Within the pyVim library, the following files need patching as follows:

/usr/local/lib/python3.8/dist-packages/pyVim/connect.py
- in function SmartConnect, line 796
- in function \_\_RetrieveContent line 468
- in function SmartStubAdapter line 744

```
httpProxyHost = os.environ.get('VMWARE_PROXY_HOST')
httpProxyPort = os.environ.get('VMWARE_PROXY_PORT')
```
SmartConnect also needs these passing as the last 2 arguments to \_\_FindSupportedVersion


`vmware/vapi/protocol/client/rpc/requests_provider.py", line 95, in do_request`
Needs patching to give `verify=self._session.verify` as the final arg to `self._session.request`

