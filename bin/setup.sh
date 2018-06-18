#!/bin/bash
service ssh start
hdfs namenode -format -force
/usr/local/hadoop-2.8.2/sbin/start-dfs.sh
/usr/local/hadoop-2.8.2/sbin/start-yarn.sh
