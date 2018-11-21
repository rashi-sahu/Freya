cd /usr/local
sudo wget http://mirrors.wuchna.com/apachemirror/cassandra/3.11.3/apache-cassandra-3.11.3-bin.tar.gz
tar -xvf apache-cassandra-3.11.3-bin.tar.gz 
sudo chmod 777 apache-cassandra-3.11.3/*
cd apache-cassandra-3.11.3/bin 
./cassandra -f
