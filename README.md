# Freya

Freya is an implementation of Lambda Architecture ([LA](http://lambda-architecture.net/)). It setups LA on any number of commodity computers. It runs on the top of Apache Hadoop(for Batch Processing) and Apache Strom(for Stream Processing). 

### Use Case:
Let' say you have huge amount of data(Peta-byte scale) and you want to do some processing on that (e.g. Image processing, machine learning classification etc.)
Doing it on a single computer is not a good idea as the data is huge. You can parallelize the task(assuming no data dependency) among many computers. Freya does this same thing. It setups a Lambda Architecture, abstracting all the complexities involved and giving a hassle-free experience. 

### How to install:

#### For Ubuntu Machines:

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
- Install Apache Hadoop
    ```
    $ ./hadoop_installer.sh
    ```
- Install Apache Storm
    ```
    $ ./storm_installer.sh
    ```
- Run Apache Hadoop
    ```
    $ cd /usr/local/hadoop
    $ sbin/start-all.sh
    ``` 
    Move to http://localhost:50070/ to see hadoop dashboard

- Run Apache Storm 
    ```
    $ cd /usr/local/storm
    $ zookeeper-3.4.13/bin/zkServer.sh start
    ``` 
    Move to http://localhost:8080/ to see storm dashboard
- To Stop Apache Hadoop
    ```
    $ cd /usr/local/hadoop
    $ sbin/stop-all.sh
    ``` 
    
- Stop Apache Storm
    ```
    zookeeper-3.4.13/bin/zkServer.sh stop
    ```
 