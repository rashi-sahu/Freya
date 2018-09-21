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
    echo "The file '~/.ssh/id_rsa.pub' does not exist."
fi