FROM       xemuliam/hdf-base
MAINTAINER Viacheslav Kalashnikov <xemuliam@gmail.com>
LABEL      VERSION="2.0" \
           RUN="docker run -d -p 8080:8080 -p 8081:8081 -p 8443:8443 xemuliam/hdf"
ENV        INSTANCE_ROLE=single-node \
           USE_EMBEDDED_ZK=false \
           ZK_NODES_LIST=N/A \
           MYID=N/A
COPY       start_hdf.sh /${HDF_HOME}/
VOLUME     /opt/datafiles \
           /opt/scriptfiles \
           /opt/certs
WORKDIR    ${HDF_HOME}
RUN        chmod +x ./start_hdf.sh
CMD        ./start_hdf.sh
