###########################################################################################
# Script for setting up additional nodes apart from main node
###########################################################################################
# Assumption is Hadoo is already configured ans setup.

# To add secondary namenode configuration in conf/master
cat master2 > $HADOOP_CONF_DIR/masters

# To Add data nodes into slaves file
cat slave1 > $HADOOP_CONF_DIR/slaves
cat slave2 >> $HADOOP_CONF_DIR/slaves
cat slave3 >> $HADOOP_CONF_DIR/slaves


# To set the hostname
cat <host_name> > /etc/hostname

# To sync up hosts file in all the machines
login as root
su root
grep -q "^master1" /etc/hosts && sed "s/^master1=.*/master1 <master_1_ip>/" -i file || sed "$ a\master1 <master_1_ip>" -i /etc/hosts
grep -q "^master2" /etc/hosts && sed "s/^master2=.*/master1 <master_2_ip>/" -i file || sed "$ a\master2 <master_2_ip>" -i /etc/hosts
grep -q "^master3" /etc/hosts && sed "s/^master3=.*/master1 <master_3_ip>/" -i file || sed "$ a\master3 <master_3_ip>" -i /etc/hosts
grep -q "^slave1" /etc/hosts && sed "s/^slave1=.*/slave1 <slave_1_ip>/" -i file || sed "$ a\slave1 <slave_1_ip>" -i /etc/hosts
grep -q "^slave2" /etc/hosts && sed "s/^slave2=.*/slave1 <slave_2_ip>/" -i file || sed "$ a\slave2 <slave_2_ip>" -i /etc/hosts
grep -q "^slave3" /etc/hosts && sed "s/^slave3=.*/slave1 <slave_3_ip>/" -i file || sed "$ a\slave3 <slave_3_ip>" -i /etc/hosts


###########################################################################################
# Secondary Namenode  / Other services
###########################################################################################
# Set up evrything mentioned in revious file..
# rsync conf from namenode

###########################################################################################
# data Nodes  / Yarn Task Nodes
###########################################################################################
# Set up evrything mentioned in revious file..
# rsync conf from namenode


bin/hadoop-daemon.sh start [namenode | secondarynamenode | datanode | jobtracker | tasktracker]
rsync -avz -e "ssh -p1234  -i $HOME/.ssh/*.pem" "$HADOOP_CONF_DIR" "hadoop@master2:$HADOOP_CONF_DIR"
