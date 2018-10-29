if [ -r ~/.ssh/id_rsa.pub ]; then
    content=$(cat ~/.ssh/id_rsa.pub)
    echo "Public key exists...."
    echo $content
else
    ssh-keygen -t rsa -P ""
fi