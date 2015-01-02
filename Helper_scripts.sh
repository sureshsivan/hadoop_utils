JAVA_HOME=/big_data/apps/java/java.default
JDK_HOME=$JAVA_HOME
JRE_HOME=$JDK_HOME/jre
export JAVA_HOME
export JDK_HOME
export JRE_HOME

HADOOP_PREFIX=/big_data/apps/hadoop/hadoop.default
HADOOP_HOME=$HADOOP_PREFIX
HADOOP_CONF_DIR=/big_data/conf/hadoop/hadoop.default
HADOOP_LOG_DIR=/big_data/log/hadoop_log
export HADOOP_PREFIX
export HADOOP_HOME
export HADOOP_CONF_DIR
export HADOOP_LOG_DIR

function say_hello(){
	echo "HELLO";
}

function helpme(){
	echo "";
	echo "";
	echo "########################################################################################################";
        echo "  Various Utility Commands  (suresh.sivanantham@gmail.com) "
	echo "  !!!  Items Marked with [X] are not intended for direct use - though it works fine"
        echo "########################################################################################################";
	echo "(1)  say_hello  ::  Just Prints HELLO to the console";
	echo "(2)  switch_to_java6  ::  To Switch Current Java Version to Java 6";
	echo "(3)  switch_to_java7  ::  To Switch Current Java Version to Java 7";
        echo "(4)  switch_to_hadoop_1_2_1  ::  To Switch Current Hadoop Version to Hadoop 1.2.1";
        echo "(5)  switch_to_hadoop_2_4_1  ::  To Switch Current Hadoop Version to Hadoop 2.4.1";
	echo "(6)  [X] switch_hadoop_1_pseudo_conf :: To Switch Hadoop Configaration to Hadoop 1 PSEUDO Mode";
        echo "(7)  [X] switch_hadoop_1_cluster_conf :: To Switch Hadoop Configaration to Hadoop 1 CLUSTER Mode";
        echo "(8)  [X] switch_hadoop_2_pseudo_conf :: To Switch Hadoop Configaration to Hadoop 2 PSEUDO Mode";
        echo "(9)  [X] switch_hadoop_2_cluster_conf :: To Switch Hadoop Configaration to Hadoop 2 CLUSTER Mode";
	echo "(10) switch_hadoop_1_pseudo :: Switch Hadoop and Conf to Hadoop Version 1.2.1 - PSEUDO MODE"
        echo "(11) switch_hadoop_1_cluster :: Switch Hadoop and Conf to Hadoop Version 1.2.1 - CLUSTER MODE"
        echo "(12) switch_hadoop_2_pseudo :: Switch Hadoop and Conf to Hadoop Version 2.4.1 - PSEUDO MODE"
        echo "(13) switch_hadoop_2_cluster :: Switch Hadoop and Conf to Hadoop Version 2.4.1 - CLUSTER MODE"
        echo "#######################################################################################################";
	echo "";
	echo "";
}

function switch_to_java6(){
	rm -f /big_data/apps/java/java.default;
	ln -s /big_data/apps/java/java6/ /big_data/apps/java/java.default;
}

function switch_to_java7(){
        rm -f /big_data/apps/java/java.default;
        ln -s /big_data/apps/java/java7/ /big_data/apps/java/java.default;
}

function switch_to_hadoop_1_2_1(){
	rm -f /big_data/apps/hadoop/hadoop.default;
	ln -s /big_data/apps/hadoop/hadoop_1_2_1 /big_data/apps/hadoop/hadoop.default;
}

function switch_to_hadoop_2_4_1(){
        rm -f /big_data/apps/hadoop/hadoop.default;
        ln -s /big_data/apps/hadoop/hadoop_2_4_1 /big_data/apps/hadoop/hadoop.default;
}

function switch_hadoop_1_pseudo_conf(){
        rm -f /big_data/conf/hadoop/hadoop.default;
        ln -s /big_data/conf/hadoop/hadoop.1.pseudo /big_data/conf/hadoop/hadoop.default;
}

function switch_hadoop_1_cluster_conf(){ 
        rm -f /big_data/conf/hadoop/hadoop.default;
        ln -s /big_data/conf/hadoop/hadoop.1.cluster /big_data/conf/hadoop/hadoop.default;
}

function switch_hadoop_2_pseudo_conf(){
        rm -f /big_data/conf/hadoop/hadoop.default;
        ln -s /big_data/conf/hadoop/hadoop.2.pseudo /big_data/conf/hadoop/hadoop.default;
}

function switch_hadoop_2_cluster_conf(){
        rm -f /big_data/conf/hadoop/hadoop.default;
        ln -s /big_data/conf/hadoop/hadoop.2.cluster /big_data/conf/hadoop/hadoop.default;
}

function switch_hadoop_1_pseudo(){
	switch_to_hadoop_1_2_1;
	switch_hadoop_1_pseudo_conf
}

function switch_hadoop_1_cluster(){
        switch_to_hadoop_1_2_1;
        switch_hadoop_1_cluster_conf;
}

function switch_hadoop_2_pseudo(){
        switch_to_hadoop_2_4_1;
        switch_hadoop_2_pseudo_conf
}

function switch_hadoop_2_cluster(){
        switch_to_hadoop_2_4_1;
        switch_hadoop_2_cluster_conf;
}


PATH=$PATH:$JDK_HOME/bin:$HADOOP_PREFIX/bin


http://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.0.0.2/bk_installing_manually_book/content/rpm_chap3.html
============================================================================================================
hadoop.tmp.dir
fs.default.name
fs.checkpoint.dir
dfs.name.dir
dfs.data.dir
yarn.nodemanager.local-dirs
yarn.nodemanager.log-dirs


Directory Structure
===================
.
├── apps
│   ├── hadoop
│   │   ├── hadoop_1_2_1
│   │   ├── hadoop_2_4_1
│   │   └── hadoop.default -> /big_data/apps/hadoop/hadoop_2_4_1
│   └── java
│       ├── java6
│       ├── java7
│       └── java.default -> /big_data/apps/java/java6/
├── bakup
│   ├── apache-hive-0.14.0-bin.tar.gz
│   ├── eclipse-jee-indigo-SR2-linux-gtk-x86_64.tar.gz
│   ├── pig-0.14.0.tar.gz
│   ├── solr-4.10.3.zip
│   ├── sqoop-1.4.5.bin__hadoop-0.20.tar.gz
│   ├── sqoop-1.4.5.bin__hadoop-0.23.tar.gz
│   ├── sqoop-1.4.5.bin__hadoop-1.0.0.tar.gz
│   ├── sqoop-1.4.5.bin__hadoop-2.0.4-alpha.tar.gz
│   ├── sqoop-1.99.4-bin-hadoop100.tar.gz
│   ├── sqoop-1.99.4-bin-hadoop200.tar.gz
│   └── zookeeper-3.4.6.tar.gz
├── conf
│   ├── hadoop
│   │   ├── hadoop.1.cluster
│   │   ├── hadoop.1.original
│   │   ├── hadoop.1.pseudo
│   │   ├── hadoop.2.cluster
│   │   ├── hadoop.2.original
│   │   ├── hadoop.2.pseudo
│   │   └── hadoop.default -> /big_data/conf/hadoop/hadoop.2.pseudo
│   ├── hive
│   └── pig
├── data
│   ├── hadoop1
│   └── hadoop2
└── logs
    └── hadoop
        ├── hadoop.1.cluster
        ├── hadoop.1.pseudo
        ├── hadoop.2.cluster
        ├── hadoop.2.pseudo
        └── hadoop.default -> /big_data/logs/hadoop/hadoop.2.pseudo



core-site.xml
=============
  <property>
    <name>fs.default.name</name>
    <value>hdfs://localhost:8020</value>
    <description>The name of the default file system.  Either the  literal string "local" or a host:port for NDFS.</description>
    <final>true</final>
  </property>
     <property>
         <name>hadoop.tmp.dir</name>
         <value>/big_data/logs/hadoop/hadoop.default/hadoop.tmp</value>
			<final>true</final>
     </property>
  <property>
    <name>fs.checkpoint.dir</name>
    <value>/big_data/data/hadoop/hadoop.default/fs.checkpoint</value>
    <description>Determines where on the local filesystem the DFS secondary
        name node should store the temporary images to merge.
        If this is a comma-delimited list of directories then the image is
        replicated in all of the directories for redundancy.
    </description>
  </property>

    <property>
    <name>fs.checkpoint.edits.dir</name>
    <value>${fs.checkpoint.dir}</value>
    <description>Determines where on the local filesystem the DFS secondary
        name node should store the temporary edits to merge.
        If this is a comma-delimited list of directoires then teh edits is
        replicated in all of the directoires for redundancy.
        Default value is same as fs.checkpoint.dir
    </description>
  </property>


hdfs-site.xml
=============
  <property>
    <name>dfs.name.dir</name>
		<value>/big_data/data/hadoop/hadoop.default/dfs.name</value>
    <description>Determines where on the local filesystem the DFS name node
      should store the name table.  If this is a comma-delimited list
      of directories then the name table is replicated in all of the
      directories, for redundancy. </description>
    <final>true</final>
  </property>

  <property>
    <name>dfs.support.append</name>
    <value>true</value>
    <description>to enable dfs append</description>
    <final>true</final>
  </property>

  <property>
    <name>dfs.webhdfs.enabled</name>
    <value>true</value>
    <description>to enable webhdfs</description>
    <final>true</final>
  </property>

  <property>
    <name>dfs.data.dir</name>
		<value>/big_data/data/hadoop/hadoop.default/dfs.data</value>
    <description>Determines where on the local filesystem an DFS data node
  		should store its blocks.  If this is a comma-delimited
  		list of directories, then data will be stored in all named
  		directories, typically on different devices.
  		Directories that do not exist are ignored.
  	</description>
  	<final>true</final>
  </property>



mapred-site.xml
===============
  <property>
    <name>mapreduce.framework.name</name>
    <value>yarn</value>
  </property>
  <property>
   <name>yarn.app.mapreduce.am.staging-dir</name>
   <value>/big_data/logs/hadoop/hadoop.default/yarn.app.mr.am.staging</value>
  </property>
  <property>
    <name>mapreduce.cluster.local.dir</name>
    <value>/big_data/logs/hadoop/hadoop.default/mapreduce.cluster.local</value>
    <description>No description</description>
    <final>true</final>
  </property>
  <property>
   <name>mapreduce.jobhistory.intermediate-done-dir</name>
   <value>/big_data/logs/hadoop/hadoop.default/mapreduce.jobhistory.intermediate-done-dir</value>
  </property>
  <property>
   <name>mapreduce.jobhistory.done-dir</name>
   <value>/big_data/logs/hadoop/hadoop.default/mapreduce.jobhistory.done-dir</value>
  </property>


yarn-site.xml
==============
  <property>
    <name>yarn.nodemanager.local-dirs</name>
    <value>/big_data/logs/hadoop/hadoop.default/yarn.nodemanager.local</value>
  </property>
<property>
    <name>yarn.nodemanager.log-dirs</name>
    <value>/big_data/logs/hadoop/hadoop.default/yarn.nodemanager.log-</value>
  </property>
  <property>
    <name>yarn.nodemanager.remote-app-log-dir</name>
    <value>/big_data/logs/hadoop/hadoop.default/yarn.nodemanager.remote-app-log</value>
  </property>

  <property>
    <name>yarn.nodemanager.remote-app-log-dir-suffix</name>
    <value>remoteapplog</value>
  </property>




  Envs : 
  ======
  HADOOP_SECURE_DN_LOG_DIR=$HADOOP_LOG_DIR
  HADOOP_PID_DIR=$HADOOP_LOG_DIR
  HADOOP_SECURE_DN_PID_DIR=$HADOOP_LOG_DIR
  HADOOP_OPTS="-Djava.net.preferIPv4Stack=true ${HADOOP_OPTS}"
  HADOOP_LIBEXEC_DIR=${HADOOP_HOME}/lib/hadoop/libexec
  YARN_CONF_DIR=$HADOOP_CONF_DIR
  YARN_LOG_DIR=$HADOOP_LOG_DIR
  YARN_PID_DIR=$HADOOP_LOG_DIR
  HADOOP_DATA_DIR=/big_data/data/hadoop.default
  PIG_HOME=/big_data/apps/pig/pig.default
  PIG_CONF_DIR=/big_data/conf/pig/pig.default
  PIG_LOG_DIR=/big_data/logs/pig/pig.default
  HIVE_HOME=/big_data/apps/hive/hive.default
  HIVE_CONF_DIR=/big_data/conf/hive/hive.default
  ZOOKEEPER_PREFIX=/big_data/apps/zookeeper/zookeeper.default
  ZOO_LOG_DIR=/big_data/logs/zookeeper/zookeeper.default
  ZOOCFGDIR=/big_data/conf/zookeeper/zookeeper.default
  



  Commands : 
  =========
  mkdir -p $HADOOP_DATA_DIR/fs.checkpoint
  mkdir -p $HADOOP_DATA_DIR/dfs.name
  mkdir -p $HADOOP_DATA_DIR/dfs.data

  mkdir -p $HADOOP_LOG_DIR/yarn.app.mr.am.staging
  mkdir -p $HADOOP_LOG_DIR/mapreduce.cluster.local
  mkdir -p $HADOOP_LOG_DIR/mapreduce.jobhistory.intermediate-done-dir
  mkdir -p $HADOOP_LOG_DIR/mapreduce.jobhistory.done-dir
  mkdir -p $HADOOP_LOG_DIR/yarn.nodemanager.local
  mkdir -p $HADOOP_LOG_DIR/yarn.nodemanager.log
  mkdir -p $HADOOP_LOG_DIR/yarn.nodemanager.remote-app-log
  mkdir -p $HADOOP_LOG_DIR/hadoop.tmp
  mkdir -p $HADOOP_LOG_DIR/
  mkdir -p $HADOOP_LOG_DIR/
  mkdir -p $HADOOP_LOG_DIR/
  mkdir -p $HADOOP_LOG_DIR/
  mkdir -p $HADOOP_LOG_DIR/
  mkdir -p $HADOOP_LOG_DIR/
  mkdir -p $HADOOP_LOG_DIR/



function starthadoop2(){
	hadoop-daemon.sh start namenode;
	hadoop-daemon.sh start secondarynamenode;
	hadoop-daemon.sh start datanode;
	yarn-daemon.sh start nodemanager;
	yarn-daemon.sh start resourcemanager;
	mr-jobhistory-daemon.sh start historyserver;
}
function stophadoop2(){
	hadoop-daemon.sh stop namenode;
	hadoop-daemon.sh stop secondarynamenode;
	hadoop-daemon.sh stop datanode;
	yarn-daemon.sh stop nodemanager;
	yarn-daemon.sh stop resourcemanager;
	mr-jobhistory-daemon.sh stop historyserver;
}
function starthadoop1(){
	hadoop-daemon.sh start namenode;
	hadoop-daemon.sh start secondarynamenode;
	hadoop-daemon.sh start datanode;
	hadoop-daemon.sh start jobtracker;
	hadoop-daemon.sh start tasktracker;
}
function stophadoop1(){
	hadoop-daemon.sh stop namenode;
	hadoop-daemon.sh stop secondarynamenode;
	hadoop-daemon.sh stop datanode;
	hadoop-daemon.sh stop jobtracker;
	hadoop-daemon.sh stop tasktracker;
}
function startzoo(){
	zkServer.sh start;
}
function stopzoo(){
	zkServer.sh stop;
}
