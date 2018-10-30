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
sudo echo "tickTime=2000"  >> conf/zoo.cfg
sudo echo "dataDir=/usr/local/storm/zookeeper-3.4.13/data" >> conf/zoo.cfg
sudo echo "clientPort=2181"  >> conf/zoo.cfg
sudo echo "initLimit=5"  >> conf/zoo.cfg
sudo echo "syncLimit=2" >> conf/zoo.cfg
sudo echo "autopurge.purgeInterval=24" >> conf/zoo.cfg
sudo echo "autopurge.snapRetainCount=5" >> conf/zoo.cfg
echo "Zookeeper installation complete......"

cd ..
sudo wget https://github.com/zeromq/libzmq/releases/download/v4.2.2/zeromq-4.2.2.tar.gz
sudo tar xvzf zeromq-4.2.2.tar.gz
sudo apt-get update && \
sudo apt-get install -y libtool pkg-config build-essential autoconf automake uuid-dev
cd zeromq-4.2.2
sudo ./configure
sudo make install
sudo ldconfig
sudo ldconfig -p | grep zmq

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


 