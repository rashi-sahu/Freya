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
