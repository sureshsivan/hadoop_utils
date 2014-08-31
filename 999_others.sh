[1]
nano /etc/security/limits.conf
*	soft	nofile	8192
*	hard	nofile	8192

[2]
more $HADOOP_CONF_DIR/hdfs-site.xml

[3]
# DFS File System
http://master1:50070/
# File System - Browse
http://master1:50070/explorer.html#/
# secondary namenode status
http://master2:50090/status.jsp
#[IPC]	http://master2:10020/
#Job History server
http://master2:19888/jobhistory
#[IPC]	http://master2:8025/
#[IPC]	http://master2:8030/
#[IPC]	http://master2:8050/
#[IPC]	http://master2:8141/
#[IPC]	http://slave1:45454/
#[NG]	http://slave1:50010/
#	Data Node status
http://slave1:50075/dataNodeHome.jsp
#[IPC]	http://slave1:8010/
