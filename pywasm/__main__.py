import json
import math
import os
import sys

from . import load
if sys.argv[-1].endswith('.wasm'):
    rt = load(sys.argv[-1])
    rt.exec("main",[])


