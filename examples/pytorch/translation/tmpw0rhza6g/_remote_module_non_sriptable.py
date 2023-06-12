from typing import *

import torch
import torch.distributed.rpc as rpc
from torch import Tensor
from torch._jit_internal import Future
from torch.distributed.rpc import RRef


module_interface_cls = None



def _remote_forward(module_rref: RRef[module_interface_cls], *args, **kwargs):  # noqa
    module = module_rref.local_value()
    return module.forward(*args, **kwargs)


def forward_async(self, *args, **kwargs):  # noqa
    args = (self.module_rref, *args)
    kwargs = {**kwargs}
    return rpc.rpc_async(
        self.module_rref.owner(),
        _remote_forward,
        args,
        kwargs,
    )


def forward(self, *args, **kwargs):  # noqa
    args = (self.module_rref, *args)
    kwargs = {**kwargs}
    ret_fut = rpc.rpc_async(
        self.module_rref.owner(),
        _remote_forward,
        args,
        kwargs,
    )
    return ret_fut.wait()


_generated_methods = [
    forward_async,
    forward,
]
