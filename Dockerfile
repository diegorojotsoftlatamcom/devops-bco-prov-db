FROM microsoft/mssql-server-linux:latest

MAINTAINER TSOFT <contacte@tsoftglobal.com>

### Atomic/OpenShift Labels - https://github.com/projectatomic/ContainerApplicationGenericLabels
LABEL name="tsoft/sqlserver" \
      maintainer="contacte@tsoftglobal.com" \
      vendor="TSOFT" \
      version="1.0" \
      release="1" \
      summary="Sql server" \
      description="Sql server" \
### Required labels above - recommended below
      url="https://www.tsoftglobal.com" \
      run='docker run -tdi --name ${NAME} \
      -u 123456 \
      io.k8s.description="Sql server" \
      io.k8s.display-name="Sql server" \
      io.openshift.expose-services="" \
      io.openshift.tags="tsoft,sql,sqlserver,microsoft"

RUN apt-get -y update  && \
        apt-get install -y curl

ENV ACCEPT_EULA Y
ENV USER sa
ENV SA_PASSWORD Yukon900






### Setup user for build execution and application runtime

# Create app directory
ENV APP_ROOT=/usr/src/app
ENV OPT_SYSTEM=/var/opt/system

# Bundle app source
COPY . ${APP_ROOT}

RUN chmod -R u+x ${APP_ROOT} && \
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT} /etc/passwd && \
	
	chmod -R u+x ${OPT_SYSTEM} && \
    chgrp -R 0 ${OPT_SYSTEM} && \
    chmod -R g=u ${OPT_SYSTEM} /etc/passwd && \
	
	# Grant permissions for the import-data script to be executable
	chmod +x ${APP_ROOT}/import-data.sh

### Containers should NOT run as root as a good practice
USER 10001
WORKDIR ${APP_ROOT}

EXPOSE 1433

CMD /bin/bash ./entrypoint.sh