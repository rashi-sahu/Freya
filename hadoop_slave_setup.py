slaves = []
with open('./hadoop_slaves.txt', 'r') as f:
    for line in f:
        line = line.split()
        slaves.append(line[0])
with open('/usr/local/hadoop/etc/hadoop/slaves', 'w') as f:
    for slave in slaves:
        f.write(slave+"\n")
