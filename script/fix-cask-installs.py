#!/usr/local/env python
from helpers import fix_casks
import sys

debug = "--debug" in sys.argv
brewfiles = [x for x in sys.argv if x.endswith('.Brewfile')]


# fix all the brewfiles!
for file in brewfiles: fix_casks(file, debug)
