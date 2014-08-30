[1]
# Everything from namenode
$HADOOP_PREFIX/sbin/start-all.sh
$HADOOP_PREFIX/sbin/stop-all.sh

[2]
# Form Namenode
$HADOOP_PREFIX/sbin/hadoop-daemon.sh start namenode
# From secondary namenode
$HADOOP_PREFIX/sbin/hadoop-daemon.sh start secondarynamenode
$HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh start historyserver
$HADOOP_PREFIX/sbin/yarn-daemon.sh start resourcemanager
# Every Data node
$HADOOP_PREFIX/sbin/hadoop-daemon.sh start datanode 
$HADOOP_PREFIX/sbin/yarn-daemon.sh start nodemanager

# Form Namenode
$HADOOP_PREFIX/sbin/hadoop-daemon.sh stop namenode 
# From secondary namenode
$HADOOP_PREFIX/sbin/hadoop-daemon.sh stop secondarynamenode
$HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh stop historyserver
$HADOOP_PREFIX/sbin/yarn-daemon.sh stop resourcemanager
# Every Data node
$HADOOP_PREFIX/sbin/hadoop-daemon.sh stop datanode 
$HADOOP_PREFIX/sbin/yarn-daemon.sh stop nodemanager 


[3]
$HADOOP_PREFIX/bin/hdfs namenode -format

...............
