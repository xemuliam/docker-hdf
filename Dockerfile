FROM       xemuliam/hdf-base:2.1.0
MAINTAINER Viacheslav Kalashnikov <xemuliam@gmail.com>
ENV        BANNER_TEXT="" \
           S2S_PORT=""
COPY       start_hdf.sh /${HDF_HOME}/
VOLUME     /opt/datafiles \
           /opt/scriptfiles \
           /opt/certfiles
WORKDIR    ${HDF_HOME}
RUN        chmod +x ./start_hdf.sh
CMD        ./start_hdf.sh
