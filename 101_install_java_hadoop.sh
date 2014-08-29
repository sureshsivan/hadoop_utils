##################################################################################
####  First Machine  -  NAMENODE
##################################################################################
ssh -i <key_file_path> root@<ip_address>
mkdir -p /root/tmp
# All Higher level directories
mkdir -p /bigdata  /bigdata/tmp /bigdata/apps  /bigdata/data /bigdata/conf /bigdata/logs /bigdata/pid  

# Install JDK on own and skip below section
cd /tmp
wget https://s3.amazonaws.com/hadoop_util_files/java/oracle-j2sdk1.6_1.6.0%2Bupdate31_amd64.deb
dpkg -i oracle-j2sdk1.6_1.6.0+update31_amd64.deb
rm oracle-j2sdk1.6_1.6.0+update31_amd64.deb
apt-get -f install  # May Required if jdk dependencies are missing

# Install hadoop eco system in /bigdata/apps on own and skip below section
cd /bigdata/apps
wget https://s3.amazonaws.com/hadoop_util_files/hadoop_dist/hadoop_eco.tar.gz
tar -zxvf hadoop_eco.tar.gz
rm hadoop_eco.tar.gz


chown -R hadoop:hadoop /bigdata
exit

ssh -i <key_file_path> hadoop@<ip_address>:/bigdata
ls -la  # To Check ownership
tar -zxvf hadoop-1.2.1.tar.gz
tar -zxvf hadoop-2.4.1.tar.gz

printf '\nJAVA_HOME=/usr/lib/jvm/j2sdk1.6-oracle/'	>>	~/.bashrc;	\
printf '\nexport JAVA_HOME'	>>	~/.bashrc;	\
printf '\nBIGDATA_DIR=/bigdata'	>>	~/.bashrc;	\
printf '\nexport BIGDATA_DIR'	>>	~/.bashrc;	\
printf '\nHADOOP_VERSION_DIR=hadoop-2.4.1'	>>	~/.bashrc;	\
printf '\nexport HADOOP_VERSION_DIR'	>>	~/.bashrc;  \
printf '\nHADOOP_PREFIX=$BIGDATA_DIR/apps/$HADOOP_VERSION_DIR'	>>	~/.bashrc;	\
printf '\nexport HADOOP_PREFIX'	>>	~/.bashrc;	\
printf '\nHADOOP_CONF_DIR=$BIGDATA_DIR/conf/hadoop'	>>	~/.bashrc;	\
printf '\nexport HADOOP_CONF_DIR'	>>	~/.bashrc;	\
printf '\nHADOOP_LOG_DIR=$BIGDATA_DIR/logs/hadoop'	>>	~/.bashrc;	\
printf '\nexport HADOOP_LOG_DIR'	>>	~/.bashrc;	\
printf '\nHDFS_LOG_DIR=$BIGDATA_DIR/logs/hdfs'	>>	~/.bashrc;	\
printf '\nexport HDFS_LOG_DIR'	>>	~/.bashrc;	\
printf '\nYARN_LOG_DIR=$BIGDATA_DIR/logs/yarn'	>>	~/.bashrc;	\
printf '\nexport YARN_LOG_DIR'	>>	~/.bashrc;	\
printf '\nMAPRED_LOG_DIR=$BIGDATA_DIR/logs/mapred'	>>	~/.bashrc;	\
printf '\nexport MAPRED_LOG_DIR'	>>	~/.bashrc;	\
printf '\nHADOOP_PID_DIR=$BIGDATA_DIR/pid/hdfs'	>>	~/.bashrc;	\
printf '\nexport HADOOP_PID_DIR'	>>	~/.bashrc;	\
printf '\nYARN_PID_DIR=$BIGDATA_DIR/pid/yarn'	>>	~/.bashrc;	\
printf '\nexport YARN_PID_DIR'	>>	~/.bashrc;	\
printf '\nMAPRED_PID_DIR=$BIGDATA_DIR/pid/mapred'	>>	~/.bashrc;	\
printf '\nexport MAPRED_PID_DIR\n'	>>	~/.bashrc;

source ~/.bashrc;

# Create Lower Level Directories for Hadoop Eco System to run
mkdir -p /bigdata/data/dfs.data  /bigdata/data/dfs.name  /bigdata/data/fs.checkpoint /bigdata/data/hadoop.tmp  
mkdir -p /bigdata/data/yarn  /bigdata/data/yarn/local-dirs /bigdata/data/yarn/log-dirs
mkdir -p /bigdata/conf.pseudo  /bigdata/conf.local /bigdata/conf.tmp
mkdir -p /bigdata/logs/mapred  /bigdata/logs/yarn  /bigdata/logs/hdfs
mkdir -p /bigdata/pid/mapred  /bigdata/pid/yarn  /bigdata/pid/hadoop
mkdir -p $HADOOP_LOG_DIR $HDFS_LOG_DIR $YARN_LOG_DIR $MAPRED_LOG_DIR $HADOOP_PID_DIR $YARN_PID_DIR $MAPRED_PID_DIR

