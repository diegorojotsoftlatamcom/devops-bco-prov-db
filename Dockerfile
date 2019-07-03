FROM microsoft/mssql-server-linux:latest

RUN apt-get -y update  && \
        apt-get install -y curl

ENV ACCEPT_EULA Y
ENV USER sa
ENV SA_PASSWORD Yukon900
	
# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Bundle app source
COPY . /usr/src/app

# Grant permissions for the import-data script to be executable
RUN chmod +x /usr/src/app/import-data.sh

EXPOSE 1433

CMD /bin/bash ./entrypoint.sh