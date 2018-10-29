import os
import sys
original_data = ""
new_data = ""
with file('/etc/hosts', 'r') as original:
    original_data = original.read()
with file('./nodes.txt', 'r') as nodes:
    new_data = nodes.read()
with file('/etc/hosts', 'w') as modified:
    modified.write(new_data + "\n" + original_data)

os.system("./public_key_generate.sh")
