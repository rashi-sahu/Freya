echo "Installing Java 8"
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt install oracle-java8-installer
sudo apt install oracle-java8-set-default
echo "Successfully Installed Java 8"
if [ -r ~/.ssh/id_rsa.pub ]; then
    content=$(cat ~/.ssh/id_rsa.pub)
    echo "Public key exists...."
    echo $content
else
    ssh-keygen -t rsa -P ""
fi
echo "Copying public key to authorized keys"
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
cd /usr/local
sudo wget http://mirrors.wuchna.com/apachemirror/hadoop/common/hadoop-2.9.1/hadoop-2.9.1.tar.gz
sudo tar xzf hadoop-2.9.1.tar.gz
sudo mv hadoop-2.9.1 hadoop
sudo rm -rf hadoop-2.9.1.tar.gz
echo "export HADOOP_HOME=/usr/local/hadoop" >> ~/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.bashrc
echo "unalias fs &> /dev/null" >> ~/.bashrc
echo 'alias fs="hadoop fs"' >> ~/.bashrc
echo 'unalias hls &> /dev/null' >> ~/.bashrc
echo 'alias hls="fs -ls"' >> ~/.bashrc
echo 'lzohead () {' >> ~/.bashrc
echo '  hadoop fs -cat $1 | lzop -dc | head -1000 | less' >> ~/.bashrc
echo '}' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/bin' >> ~/.bashrc
cd /usr/local/hadoop
sudo chmod -R 777 /usr/local/hadoop/
sudo truncate -s 0 etc/hadoop/core-site.xml
sudo echo "<configuration> 
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://localhost:9000</value>
    </property>
</configuration>" >> etc/hadoop/core-site.xml
