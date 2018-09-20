# Freya

Freya is an implementation of Lambda Architecture ([LA](http://lambda-architecture.net/)). It setups LA on any number of commodity computers. It runs on the top of Apache Hadoop(for Batch Processing) and Apache Strom(for Stream Processing). 

### Use Case:
Let' say you have huge amount of data(Peta-byte scale) and you want to do some processing on that (e.g. Image processing, machine learning classification etc.)
Doing it on a single computer is not a good idea as the data is huge. You can parallelize the task(assuming no data dependency) among many computers. Freya does this same thing. It setups a Lambda Architecture, abstracting all the complexities involved and giving a hassle-free experience. 
