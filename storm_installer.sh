#! /bin/bash
echo "Zookeeper-3.4.13 installation......"
mkdir storm1
cd storm1
echo "Download Zookeeper-3.4.13......"
wget http://mirrors.fibergrid.in/apache/zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz
tar -xvf zookeeper-3.4.13.tar.gz
cd zookeeper-3.4.13
mkdir data
echo "tickTime=2000
dataDir=/path/to/zookeeper/data
clientPort=2181
initLimit=5
syncLimit=2" >> conf/zoo.cfg
echo "Zookeeper installation complete......"


