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
