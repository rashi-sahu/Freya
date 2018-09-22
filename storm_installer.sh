#! /bin/bash
echo "Zookeeper-3.4.13 installation......"
cd /usr/local
sudo mkdir storm
cd storm
echo "Download Zookeeper-3.4.13......"
sudo wget http://mirrors.fibergrid.in/apache/zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz
sudo tar -xvf zookeeper-3.4.13.tar.gz
cd zookeeper-3.4.13
sudo mkdir data
sudo chmod -R 777 /usr/local/storm
sudo echo "tickTime=2000
dataDir=/path/to/zookeeper/data
clientPort=2181
initLimit=5
syncLimit=2" >> conf/zoo.cfg
echo "Zookeeper installation complete......"

cd ..
echo "Apache-Storm-1.2.2 installation......"
echo "download Apache-Storm-1.2.2......"
sudo wget http://mirrors.wuchna.com/apachemirror/storm/apache-storm-1.2.2/apache-storm-1.2.2.tar.gz
sudo tar -xvf apache-storm-1.2.2.tar.gz
cd apache-storm-1.2.2
sudo mkdir data
sudo chmod -R 777 /usr/local/storm
sudo echo "storm.zookeeper.servers:
 - "localhost"
storm.local.dir: “/path/to/storm/data(any path)”
nimbus.host: "localhost"
supervisor.slots.ports:
 - 6700
 - 6701
 - 6702
 - 6703" >> conf/storm.yaml
 echo "Apache-storm installation complete......"

 cd ..
 sudo zookeeper-3.4.13/bin/zkServer.sh start
 sudo zookeeper-3.4.13/bin/zkCli.sh &
 sudo apache-storm-1.2.2/bin/storm nimbus &
 sudo apache-storm-1.2.2/bin/storm supervisor &
 sudo apache-storm-1.2.2/bin/storm ui &


 