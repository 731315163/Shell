import os
import subprocess
from subprocess import PIPE

comp_process = subprocess.run("ls", stdout=PIPE, stderr=PIPE)
print(comp_process.stdout)