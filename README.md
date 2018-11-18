# Freya

Freya is an implementation of Lambda Architecture ([LA](http://lambda-architecture.net/)). It setups LA on any number of commodity computers. It runs on the top of Apache Hadoop(for Batch Processing) and Apache Strom(for Stream Processing). 

## Use Case:
Let' say you have huge amount of data(Peta-byte scale) and you want to do some processing on that (e.g. Image processing, machine learning classification etc.)
Doing it on a single computer is not a good idea as the data is huge. You can parallelize the task(assuming no data dependency) among many computers. Freya does this same thing. It setups a Lambda Architecture, abstracting all the complexities involved and giving a hassle-free experience. 

## How to install(For Ubuntu Machines):

### Batch Layer Setup:
We recommend adding a new user **hduser** and give it sudo access. This uniformity of usernames across all nodes proves out to be a clever way of doing ssh without password in hadoop master-slave ecosystem. Follow these steps:

- Add a new user in hadoop group (Note: You may leave all asked fields empty)
    ```
    $ sudo addgroup hadoop
    $ sudo adduser --ingroup hadoop hduser
    ```

- Add *hduser* to the list of sudoers
    ```
    $ usermod -aG sudo hduser
    ```

- **Logout** from current user and log into the *hduser*

- Clone this repository at your desired location
    ```
    $ git clone https://github.com/rashi-sahu/Freya.git
    ```
- Give executable permissions
    ```
    $ chmod 777 -R Freya
    ```
- Enter into the repository
    ```
    $ cd Freya
    ```
- Create your LAN and assign IP address to each node.
- Write the IP addresses and hostnames in ```nodes.txt``` in the given format. 
### On All  Nodes:
- Put all those IP addresses in the list of known hosts and generate public keys if not exists already.
    ```
    $ sudo python hadoop_preprocess.py
    ```
- Only after you have generated public key in **all** nodes, run below command to distribute keys for password less remote login using ssh.
    ```
    $ python distribute_keys.py
    ```
- Install Apache Hadoop:
    ```
    $ ./hadoop_installer.sh
    ```
### On Master Node only:
- Write the hostnames of slaves in the given format in ```hadoop_slave.txt```  file.
- Run the below command to setup slaves in configuration:
    ```
    $ python hadoop_slave_setup.py
    ```
- Run Apache Hadoop
    ```
    $ cd /usr/local/hadoop
    $ sbin/start-all.sh
    ``` 
    Move to http://localhost:50070/ to see hadoop dashboard

- To Stop Apache Hadoop
    ```
    $ cd /usr/local/hadoop
    $ sbin/stop-all.sh
    ``` 
    
---
### Real-Time Layer Setup:
We recommend adding a new user **storm** and give it sudo access. 

Follow these steps:

- Add a new user stormuser in storm group 
    ```
    $ sudo addgroup storm
    $ sudo adduser --ingroup storm stormuser
    ```

- Add *storm* to the list of sudoers
    ```
    $ sudo usermod -aG sudo stormuser
    ```

- **Logout** from current user and log into the *storm*

### On Master Node only:
- Install Apache Storm
    ```
    $ ./storm_installer.sh
    ```
- Run Apache Storm 
    ```
    $ cd /usr/local/storm
    $ zookeeper-3.4.13/bin/zkServer.sh start
    ``` 
    Move to http://localhost:8080/ to see storm dashboard

- Stop Apache Storm
    ```
    zookeeper-3.4.13/bin/zkServer.sh stop
    ```
 