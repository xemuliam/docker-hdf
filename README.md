# HDF ![](https://images.microbadger.com/badges/version/xemuliam/hdf:2.0.0.svg) ![](https://images.microbadger.com/badges/image/xemuliam/hdf:2.0.0.svg)
[Docker](https://www.docker.com/what-docker) image for [Hortonworks DataFlow](http://hortonworks.com/products/data-center/hdf/).

Created from HDF [base image](https://hub.docker.com/r/xemuliam/hdf-base) to minimize traffic and deployment time in case of changes should be applied on top of HDF

                        ##         .
                  ## ## ##        ==
               ## ## ## ## ##    ===
           /"""""""""""""""""\___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
           \______ o   HDF     __/
             \    \    2.0  __/
              \____\_______/


# Overview

&#x1F535; Dockerized and parametrized single- and multi-host HDF.  
&#x1F535; Site-to-site communication is switched on.  
&#x1F535; Scalability is supported.  
&#x1F534; SSL implementation sholud be the next step.


Deployment options:
- Standalone HDF node (by default built directly from image)
- Single-host HDF cluster (within sigle docker-machine) 
- Multi-host HDF cluster (within several physical hosts and/or several docker-machines)


## Migration from 1.x

All required information can be found [here](http://cwiki.apache.org/confluence/display/NIFI/Migration+Guidance)


## Used ports (all of them are configurable)

- 2881 - HDF site to site communication port
- 2882 - HDF cluster node protocol port
- 2181 - Zookeeper client port
- 2888 - Zookeeper port for monitoring HDF nodes availability
- 3888 - Zookeeper port for HDF Cluster Coordinator election


## Exposed ports

- 8080 - HDF web application port
- 8443 - HDF web application secure port
- 8081 - HDF ListenHTTP processor port


## Volumes

All below volumes can be mounted to docker host machine folders or shared folders to easy maintain data inside them. 

HDF-specific:
- /opt/nifi/logs
- /opt/nifi/flowfile_repository
- /opt/nifi/database_repository
- /opt/nifi/content_repository
- /opt/nifi/provenance_repository

User-specific:
- /opt/datafiles
- /opt/scriptfiles
- /opt/certfiles


## Additional environment properties

To add more flexibility in configuration there are some environment variables have been added to the image.  

- BANNER_TEXT - HDF instance banner text to be able to recognize instance from first look
- S2S_PORT - HDF Site-to-site communication port. If empty, default value will be used: 2881


## Official Apache HDF Documentation and Guides

- [Overview](https://nifi.apache.org/docs.html)
- [User Guide](https://nifi.apache.org/docs/nifi-docs/html/user-guide.html)
- [Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html)
- [Development Quickstart](https://nifi.apache.org/quickstart.html)
- [Developer's Guide](https://nifi.apache.org/developer-guide.html)
- [System Administrator](https://nifi.apache.org/docs/nifi-docs/html/administration-guide.html)


## ListenHTTP Processor

The standard library has a built-in processor for an HTTP endpoint listener. That processor is named [ListenHTTP](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi.processors.standard.ListenHTTP/index.html). You should set the *Listening Port* of the instantiated processor to `8081` if you follow the instructions from above.


# Usage

This image can either be used as a image for building on top of HDF or just to experiment with. I personally have not attempted to use this in a production use case.


## Pre-Requisites
Ensure the following pre-requisites are met (due to some blocker bugs in earlier versions). As of today, the latest Docker Toolbox and Homebrew are fine.

- Docker 1.10+
- Docker Compose 1.6.1+
- Docker Machine 0.6.0+

(all downloadable as a single [Docker Toolbox](https://www.docker.com/products/docker-toolbox) package as well)


## How to use from Kitematic

1. Start Kitematic
2. Enter `xemuliam` in serach box
3. Choose `hdf` image
4. Click `Create` button

Kitematic will assign all ports and you'll be able to run HDF web-interface directly from Kitematic.


## How to use from Docker CLI

1. Start Docker Quickstart Terminal
2. Run command  `docker run -d -p 8080:8080 -p 8081:8081 -p 8443:8443 xemuliam/hdf`
3. Check Docker machine IP  `docker-machine ls`
4. Use IP from previous step in address bar of your favorite browser, e.g. `http://192.168.99.100:8080/nifi`


## How to use HDF in cluster mode

Please read [explanation](https://github.com/xemuliam/docker-hdf/blob/2.x/README.Cluster.md).


# Enjoy! :)
