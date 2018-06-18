FROM singularities/spark
WORKDIR /prototype
ADD ./config /prototype/config
RUN apt-get update
RUN apt-get install -y ssh
RUN service ssh start
RUN mkdir ~/.ssh
RUN cat /dev/zero | ssh-keygen -q -N "" && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN chmod og-wx ~/.ssh/authorized_keys
RUN cp /prototype/config ~/.ssh
RUN sed -i '25s/.*/export JAVA_HOME=\/docker-java-home/' /usr/local/hadoop-2.8.2/etc/hadoop/hadoop-env.sh
RUN sed -i '20s/.*/<value>hdfs:\/\/localhost:8020<\/value>/' /usr/local/hadoop-2.8.2/etc/hadoop/core-site.xml
