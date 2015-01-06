function say_hello(){
	echo "Hello ..... !!!!!";
}
###############################################################################
## 	Java Related Env vars
###############################################################################
export JAVA_HOME=/big_data/apps/java/java.default
export JDK_HOME=$JAVA_HOME
export JRE_HOME=$JDK_HOME/jre
export JAVA_HOME
export JDK_HOME
export JRE_HOME
###############################################################################
##	Hadoop (+ Eco System Components) Related Env Vars
###############################################################################
export BIG_DATA_ROOT_DIR=/big_data
export BIG_DATA_ROOT_LOG_DIR=$BIG_DATA_ROOT_DIR/logs
export BIG_DATA_ROOT_CONF_DIR=$BIG_DATA_ROOT_DIR/conf
export BIG_DATA_ROOT_APP_DIR=$BIG_DATA_ROOT_DIR/apps
export BIG_DATA_ROOT_DATA_DIR=$BIG_DATA_ROOT_DIR/data

export HADOOP_PREFIX=$BIG_DATA_ROOT_APP_DIR/hadoop/hadoop.default
export HADOOP_HOME=$HADOOP_PREFIX
export HADOOP_CONF_DIR=$BIG_DATA_ROOT_CONF_DIR/hadoop/hadoop.default
export HADOOP_LOG_DIR=$BIG_DATA_ROOT_LOG_DIR/hadoop/hadoop.default
export HADOOP_SECURE_DN_LOG_DIR=$HADOOP_LOG_DIR
export HADOOP_PID_DIR=$HADOOP_LOG_DIR
export HADOOP_SECURE_DN_PID_DIR=$HADOOP_LOG_DIR
export HADOOP_OPTS="-Djava.net.preferIPv4Stack=true ${HADOOP_OPTS}"
#HADOOP_LIBEXEC_DIR=${HADOOP_HOME}/lib/hadoop/libexec
export HADOOP_LIBEXEC_DIR=${HADOOP_HOME}/libexec
export YARN_CONF_DIR=$HADOOP_CONF_DIR
export YARN_LOG_DIR=$HADOOP_LOG_DIR
export YARN_PID_DIR=$HADOOP_LOG_DIR
export HADOOP_DATA_DIR=$BIG_DATA_ROOT_DATA_DIR/hadoop/hadoop.default

export PIG_HOME=$BIG_DATA_ROOT_APP_DIR/pig/pig.default
export PIG_CONF_DIR=$BIG_DATA_ROOT_CONF_DIR/pig/pig.default
export PIG_LOG_DIR=$BIG_DATA_ROOT_LOG_DIR/pig/pig.default
export HIVE_HOME=$BIG_DATA_ROOT_APP_DIR/hive/hive.default
export HIVE_CONF_DIR=$BIG_DATA_ROOT_CONF_DIR/hive/hive.default
export ZOOKEEPER_PREFIX=$BIG_DATA_ROOT_APP_DIR/zookeeper/zookeeper.default
export ZOO_LOG_DIR=$BIG_DATA_ROOT_LOG_DIR/zookeeper/zookeeper.default
export ZOOCFGDIR=$BIG_DATA_ROOT_CONF_DIR/zookeeper/zookeeper.default
export SPARK_HOME=$BIG_DATA_ROOT_APP_DIR/spark/spark.default
export SPARK_CONF_DIR=$BIG_DATA_ROOT_CONF_DIR/spark/spark.default
export SPARK_LOG_DIR=$BIG_DATA_ROOT_LOG_DIR/spark/spark.default
export SPARK_PID_DIR=$SPARK_LOG_DIR


###############################################################################
##	Java Version Switch Commands
###############################################################################
function switch_to_java6(){
	rm -f /big_data/apps/java/java.default;
	ln -s /big_data/apps/java/java6/ /big_data/apps/java/java.default;
}
function switch_to_java7(){
	rm -f /big_data/apps/java/java.default;
	ln -s /big_data/apps/java/java7/ /big_data/apps/java/java.default;
}
function switch_to_java8(){
	rm -f /big_data/apps/java/java.default;
	ln -s /big_data/apps/java/java8/ /big_data/apps/java/java.default;
}


####################################################################
##	Internal Utilities
####################################################################
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
function switch_hadoop_1_pseudo_log(){
        rm -f /big_data/logs/hadoop/hadoop.default;
        ln -s /big_data/logs/hadoop/hadoop.1.pseudo /big_data/logs/hadoop/hadoop.default;
}
function switch_hadoop_1_cluster_log(){
        rm -f /big_data/logs/hadoop/hadoop.default;
        ln -s /big_data/logs/hadoop/hadoop.1.cluster /big_data/logs/hadoop/hadoop.default;
}
function switch_hadoop_2_pseudo_log(){
        rm -f /big_data/logs/hadoop/hadoop.default;
        ln -s /big_data/logs/hadoop/hadoop.2.pseudo /big_data/logs/hadoop/hadoop.default;
}
function switch_hadoop_2_cluster_log(){
        rm -f /big_data/logs/hadoop/hadoop.default;
        ln -s /big_data/logs/hadoop/hadoop.2.cluster /big_data/logs/hadoop/hadoop.default;
}
function switch_hadoop_1_pseudo_data(){
        rm -f /big_data/data/hadoop/hadoop.default;
        ln -s /big_data/data/hadoop/hadoop.1.pseudo /big_data/data/hadoop/hadoop.default;
}
function switch_hadoop_1_cluster_data(){
        rm -f /big_data/data/hadoop/hadoop.default;
        ln -s /big_data/data/hadoop/hadoop.1.cluster /big_data/data/hadoop/hadoop.default;
}
function switch_hadoop_2_pseudo_data(){
        rm -f /big_data/data/hadoop/hadoop.default;
        ln -s /big_data/data/hadoop/hadoop.2.pseudo /big_data/data/hadoop/hadoop.default;
}
function switch_hadoop_2_cluster_data(){
        rm -f /big_data/data/hadoop/hadoop.default;
        ln -s /big_data/data/hadoop/hadoop.2.cluster /big_data/data/hadoop/hadoop.default;
}
function switch_hadoop_1_pseudo(){
	switch_to_hadoop_1_2_1;
	switch_hadoop_1_pseudo_conf;
	switch_hadoop_1_pseudo_log;
	switch_hadoop_1_pseudo_data;
}
function switch_hadoop_1_cluster(){
	switch_to_hadoop_1_2_1;
	switch_hadoop_1_cluster_conf;
	switch_hadoop_1_cluster_log;
	switch_hadoop_1_cluster_data;
}
function switch_hadoop_2_pseudo(){
	switch_to_hadoop_2_4_1;
	switch_hadoop_2_pseudo_conf;
	switch_hadoop_2_pseudo_log;
	switch_hadoop_2_pseudo_data;
}
function switch_hadoop_2_cluster(){
	switch_to_hadoop_2_4_1;
	switch_hadoop_2_cluster_conf;
	switch_hadoop_2_cluster_log;
	switch_hadoop_2_cluster_data;
}
function switch_pig_0_14_0_conf(){
	rm -f /big_data/conf/pig/pig.default;
	ln -s /big_data/conf/pig/pig_0_14_0 /big_data/conf/pig/pig.default;
}
function switch_hive_0_14_0_conf(){
	rm -f /big_data/conf/hive/hive.default;
	ln -s /big_data/conf/hive/hive_0_14_0 /big_data/conf/hive/hive.default;
}
function switch_zookeeper_3_4_6_conf(){
	rm -f /big_data/conf/zookeeper/zookeeper.default;
	ln -s /big_data/conf/hive/zookeeper_3_4_6 /big_data/conf/zookeeper/zookeeper.default;
}
function switch_pig_0_14_0_logs(){
	rm -f /big_data/logs/pig/pig.default;
	ln -s /big_data/logs/pig/pig_0_14_0 /big_data/logs/pig/pig.default;
}
function switch_hive_0_14_0_logs(){
	rm -f /big_data/logs/hive/hive.default;
	ln -s /big_data/logs/hive/hive_0_14_0 /big_data/logs/hive/hive.default;
}
function switch_zookeeper_3_4_6_logs(){
	rm -f /big_data/logs/zookeeper/zookeeper.default;
	ln -s /big_data/logs/hive/zookeeper_3_4_6 /big_data/logs/zookeeper/zookeeper.default;
}
function switch_spark_1_2_0_hadoop_2_4_conf(){
	rm -f /big_data/conf/spark/spark.default;
	ln -s /big_data/conf/spark/spark_1_2_0_hadoop_2_4 /big_data/conf/spark/spark.default;
}

function switch_spark_1_2_0_hadoop_2_4_logs(){
	rm -f /big_data/logs/spark/spark.default;
	ln -s /big_data/logs/spark/spark_1_2_0_hadoop_2_4 /big_data/logs/spark/spark.default;
}
####################################################################
##	Callables
####################################################################
function start_hadoop_2_pseudo(){
	switch_hadoop_2_pseudo;
        hadoop-daemon.sh start namenode;
        hadoop-daemon.sh start secondarynamenode;
        hadoop-daemon.sh start datanode;
        yarn-daemon.sh start nodemanager;
        yarn-daemon.sh start resourcemanager;
        mr-jobhistory-daemon.sh start historyserver;
}
function start_hadoop_2_cluster(){
	switch_hadoop_2_cluster;
	hadoop-daemon.sh start namenode;
	hadoop-daemon.sh start secondarynamenode;
	hadoop-daemon.sh start datanode;
	yarn-daemon.sh start nodemanager;
	yarn-daemon.sh start resourcemanager;
	mr-jobhistory-daemon.sh start historyserver;
}
function stop_hadoop_2(){
        hadoop-daemon.sh stop namenode;
       	hadoop-daemon.sh stop secondarynamenode;
        hadoop-daemon.sh stop datanode;
        yarn-daemon.sh stop nodemanager;
        yarn-daemon.sh stop resourcemanager;
        mr-jobhistory-daemon.sh stop historyserver;
}
function stop_hadoop_2_pseudo(){
        stop_hadoop_2;
}
function stop_hadoop_2_cluster(){
        stop_hadoop_2
}

function start_hadoop_1_pseudo(){
	switch_hadoop_1_pseudo;
        hadoop-daemon.sh start namenode;
        hadoop-daemon.sh start secondarynamenode;
        hadoop-daemon.sh start datanode;
        hadoop-daemon.sh start jobtracker;
        hadoop-daemon.sh start tasktracker;
}
function start_hadoop_1_cluster(){
	switch_hadoop_1_cluster
	hadoop-daemon.sh start namenode;
	hadoop-daemon.sh start secondarynamenode;
	hadoop-daemon.sh start datanode;
	hadoop-daemon.sh start jobtracker;
	hadoop-daemon.sh start tasktracker;
}
function stop_hadoop_1(){
        hadoop-daemon.sh stop namenode;
        hadoop-daemon.sh stop secondarynamenode;
        hadoop-daemon.sh stop datanode;
        hadoop-daemon.sh stop jobtracker;
        hadoop-daemon.sh stop tasktracker;
}
function stop_hadoop_1_pseudo(){
	stop_hadoop_1;
}
function stop_hadoop_1_cluster(){
	stop_hadoop_1;
}
function switch_pig_0_14_0(){
	switch_pig_0_14_0_conf;
	switch_pig_0_14_0_logs;
	rm -f /big_data/apps/pig/pig.default;
	ln -s /big_data/apps/pig/pig_0_14_0 /big_data/apps/pig/pig.default;
}
function switch_hive_0_14_0(){
	switch_hive_0_14_0_conf;
	switch_hive_0_14_0_logs;
	rm -f /big_data/apps/hive/hive.default;
	ln -s /big_data/apps/hive/hive_0_14_0 /big_data/apps/hive/hive.default;
}
function switch_zookeeper_3_4_6(){
	switch_zookeeper_3_4_6_conf;
	switch_zookeeper_3_4_6_logs;
	rm -f /big_data/apps/zookeeper/zookeeper.default;
	ln -s /big_data/apps/zookeeper/zookeeper_3_4_6 /big_data/apps/zookeeper/zookeeper.default;
}
function switch_spark_1_2_0_hadoop_2_4(){
	switch_spark_1_2_0_hadoop_2_4_conf;
	switch_spark_1_2_0_hadoop_2_4_logs;
	rm -f /big_data/apps/spark/spark.default;
	ln -s /big_data/apps/spark/spark_1_2_0_hadoop_2_4 /big_data/apps/spark/spark.default;
}

###############################################################################
## 	Addition of Binary to system paths
###############################################################################
PATH=$PATH:$JDK_HOME/bin:$HADOOP_PREFIX/bin:$HADOOP_PREFIX/sbin:$PIG_HOME/bin:$HIVE_HOME/bin:$SPARK_HOME/bin:$SPARK_HOME/sbin

###############################################################################
## 	Helper Command for Hadoop
###############################################################################
function helpme(){
	echo "";
	echo "";
	echo "##############################################################################################################";
	echo " Various Utility Commands (suresh.sivanantham@gmail.com) "
	echo "##############################################################################################################";
	echo "";
	echo "  >>  INTERNAL COMMANDS";
	echo "---------------------------------------------------------------------------------------------------------------";
	echo "| Command                                 | Description                                                       |"
	echo "---------------------------------------------------------------------------------------------------------------";
	echo "---------------------------------------------------------------------------------------------------------------";
	echo "";
	echo "  >>  USABLE COMMANDS";
	echo "---------------------------------------------------------------------------------------------------------------";
	echo "| Command                                 | Description                                                       |"
	echo "---------------------------------------------------------------------------------------------------------------";
	echo "| start_hadoop_2_pseudo                   | XX"
	echo "| start_hadoop_2_cluster                  | XX"
	echo "| stop_hadoop_2                           | XX"
	echo "| stop_hadoop_2_pseudo                    | XX"
	echo "| stop_hadoop_2_cluster                   | XX"
	echo "| start_hadoop_1_pseudo                   | XX"
	echo "| start_hadoop_1_cluster                  | XX"
	echo "| stop_hadoop_1                           | XX"
	echo "| stop_hadoop_1_pseudo                    | XX"
	echo "| stop_hadoop_1_cluster                   | XX"
	echo "| switch_pig_0_14_0                       | XX"
	echo "| switch_hive_0_14_0                      | XX"
	echo "| switch_zookeeper_3_4_6                  | XX"
	echo "| switch_spark_1_2_0_hadoop_2_4           | XX"
	echo "| YY                                      | XX"
	echo "---------------------------------------------------------------------------------------------------------------";
	echo "###############################################################################################################";
	echo "";
	echo "";
}
