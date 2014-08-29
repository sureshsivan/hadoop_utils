###########################################################################################
###########################################################################################
# Script for setting up additional nodes apart from main node
###########################################################################################
###########################################################################################
##  master1 - namenode
##  master2 - secondarynamenode
##  slaves[1-4] - datanodes

###########################################################################################
# Script for setting up additional nodes apart from main node
###########################################################################################
# Assumption is Hadoop is already configured and setup in secondary namenode machine
#     (https://github.com/v8-suresh/hadoop_utils/blob/master/101_install_java_hadoop.sh)
# To add secondary namenode configuration in conf/master
ssh -i <key_file_path> hadoop@master
cat master2 > $HADOOP_CONF_DIR/masters





# To Add data nodes into slaves file
cat slave1 > $HADOOP_CONF_DIR/slaves
cat slave2 >> $HADOOP_CONF_DIR/slaves
cat slave3 >> $HADOOP_CONF_DIR/slaves

# To set the hostname
echo 'master1' > /etc/hostname


###########################################################################################
# Secondary Namenode  / Other services
###########################################################################################
# Assumption is Hadoop is already configured ans setup(https://github.com/v8-suresh/hadoop_utils/blob/master/101_install_java_hadoop.sh)
# To set the hostname
cat master1 > /etc/hostname

# Password less login from namenode to secondarynamenode
ssh -i <key_file_path> hadoop@master1
ssh-copy-id -i ~/.ssh/id_rsa.pub hadoop@master2
# rsync conf from namenode to secondary namenode
rsync -avz -e "ssh -i $HOME/.ssh/<key_file>" "$HADOOP_CONF_DIR" "hadoop@master2:$HADOOP_CONF_DIR"

###########################################################################################
# data Nodes  / Yarn Task Nodes
###########################################################################################
# Set up evrything mentioned in revious file..
# rsync conf from namenode


bin/hadoop-daemon.sh start [namenode | secondarynamenode | datanode | jobtracker | tasktracker]
rsync -avz -e "ssh -p1234  -i $HOME/.ssh/*.pem" "$HADOOP_CONF_DIR" "hadoop@master2:$HADOOP_CONF_DIR"

# Allow client to connect to all nodes of Hadoop directly(without password through user hadoop).

