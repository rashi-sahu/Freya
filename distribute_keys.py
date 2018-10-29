import os
import sys
hostnames = []
with open('./nodes.txt', 'r') as f:
    for line in f:
        line = line.split()
        print line[1]
        hostnames.append(line[1])
for host in hostnames:
    os.system("ssh-copy-id -i ~/.ssh/id_rsa.pub hduser&"+host)
