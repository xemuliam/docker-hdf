FROM       xemuliam/hdf-base
MAINTAINER Viacheslav Kalashnikov <xemuliam@gmail.com>
COPY       start_hdf.sh /${HDF_HOME}/
VOLUME     /opt/datafiles \
           /opt/scriptfiles \
           /opt/certs
WORKDIR    ${HDF_HOME}
RUN        chmod +x ./start_hdf.sh
CMD        ./start_hdf.sh
