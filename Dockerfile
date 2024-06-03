FROM redhat/ubi8:latest

LABEL "provider"="Volthread & WSO2" \

      "maintainer"="Volthread Support System (WLSDM): https://support.volthread.com"
#Environment
ENV JAVA_HOME="/data/wso2/jdk/jdk-11.0.19" \
WSO2_MI_HOME="/data/wso2/wso2mi-4.2.0" \
WSO2_MIDASH_HOME="/data/wso2/wso2mi-dashboard-4.2.0" \
SERVER_ADDRESS="0.0.0.0" \
MID_SERVER_PORT="9743" \
WSO2_PKG_ARCHIVE="/data/wso2/wso2.tar.gz" \
PATH="/data/wso2/jdk/jdk-11.0.19/bin:/data/wso2/wso2mi-4.2.0/bin:/data/wso2/wso2mi-dashboard-4.2.0/bin:${PATH}"

#Execute Prerequisites
RUN mkdir /data && \

    useradd -b /data -d /data/wso2 -m -s /bin/bash wso2 && \
    chmod -R 775 /data/wso2 && \
    dnf install tar -y && \
    dnf install procps-ng -y
    
#Copy setup files
COPY ./setup.files/wso2.tar.gz /data/wso2/
COPY startWso2.sh /data/wso2/

#RUN tar --extract --file $WSO2_PKG_ARCHIVE --directory /data/wso2 --strip-components 1 && \
RUN cd /data/wso2 && \

    tar -xzvf wso2.tar.gz --strip-components 1 && \
    chown wso2:wso2 -R /data && \
    chmod -R 775 /data/wso2 && \
    rm -rf /data/wso2/wso2.tar.gz

#Copy config files
COPY ./config.files/dashboard/deployment.toml $WSO2_MIDASH_HOME/conf/.
COPY ./config.files/microintegrator/deployment.toml $WSO2_MI_HOME/conf/.

#Container config
USER wso2
EXPOSE 9743

#Init Command
#CMD ["/data/wso2/wso2mi-dashboard-4.2.0/bin/dashboard.sh","start ; sleep infinity"]
CMD ["/bin/bash", "-c", "/data/wso2/wso2mi-dashboard-4.2.0/bin/dashboard.sh start ; /data/wso2/wso2mi-4.2.0/bin/micro-integrator.sh start ; sleep infinity"]
