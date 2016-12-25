FROM reetawwsum/hadoop

MAINTAINER Reet Awwsum <reetawwsum@yahoo.com>

RUN curl http://d3kbcqa49mib13.cloudfront.net/spark-2.0.2-bin-hadoop2.7.tgz | tar -xz -C /usr/local
RUN ln -s /usr/local/spark-2.0.2-bin-hadoop2.7 /usr/local/spark

ENV SPARK_HOME /usr/local/spark

RUN mkdir $SPARK_HOME/yarn-remote-client
ADD yarn-remote-client $SPARK_HOME/yarn-remote-client

ENV PATH $PATH:$SPARK_HOME/bin

WORKDIR /usr/local/spark

ADD bootstrap.sh /usr/local/src/bootstrap.sh
RUN chown root:root /usr/local/src/bootstrap.sh
RUN chmod 700 /usr/local/src/bootstrap.sh

ENTRYPOINT ["/usr/local/src/bootstrap.sh"]