#########################################################################################
## This script will setup the configuration for main node.
## For any other nodes, same configurations can be copied - rsync-ed
#########################################################################################
# Get Configurations
ssh -i <key_file_path> ubuntu@<namenode_host_name>
cd $HADOOP_CONF_DIR;
wget https://s3.amazonaws.com/hadoop_util_files/hadoop_conf/conf.tar.gz;
chmod +x conf.tar.gz;   \
tar zxvf ./conf.tar.gz -C ./;   \
rm conf.tar.gz; \
touch $HADOOP_CONF_DIR/masters; \
> $HADOOP_CONF_DIR/masters; \
> $HADOOP_CONF_DIR/slaves; \
chmod -R 744 .; 

##!! Ensure that line next to property name is actually value node
##!! If there are any comments in between - this command will add will hold duplicate value node
##!! Remove referenced config for fs.checkpoint.edits.dir from core-site.xml
#SEDing hadoop xml configs
# core-site.xml
#   fs.default.name
sed -i '/<name>fs.default.name<\/name>/{n;s/.*/\t<value>hdfs:\/\/<namenode_host_name>:8020<\/value>/;}' core-site.xml;   
#   fs.checkpoint.dir   \
sed -i '/<name>fs.checkpoint.dir<\/name>/{n;s/.*/\t<value>\/bigdata\/data\/fs.checkpoint<\/value>/;}' core-site.xml;        
#   hadoop.tmp.dir  \
sed -i '/<name>hadoop.tmp.dir<\/name>/{n;s/.*/\t<value>\/bigdata\/data\/hadoop.tmp<\/value>/;}' core-site.xml;  
#   fs.checkpoint.edits.dir \
sed -i '/<name>fs.checkpoint.edits.dir<\/name>/{n;s/.*/\t<value>\/bigdata\/data\/fs.checkpoint<\/value>/;}' core-site.xml;

# hdfs-site.xml
#   dfs.name.dir
sed -i '/<name>dfs.name.dir<\/name>/{n;s/.*/\t<value>\/bigdata\/data\/dfs.name<\/value>/;}' hdfs-site.xml
#   dfs.data.dir
sed -i '/<name>dfs.data.dir<\/name>/{n;s/.*/\t<value>\/bigdata\/data\/dfs.data<\/value>/;}' hdfs-site.xml
#   dfs.http.address
sed -i '/<name>dfs.http.address<\/name>/{n;s/.*/\t<value><sec_namenode_host_name>:50070<\/value>/;}' hdfs-site.xml
#   dfs.secondary.http.address
sed -i '/<name>dfs.secondary.http.address<\/name>/{n;s/.*/\t<value><sec_namenode_host_name>:50090<\/value>/;}' hdfs-site.xml
#   dfs.https.address
sed -i '/<name>dfs.https.address<\/name>/{n;s/.*/\t<value>master2:50470<\/value>/;}' hdfs-site.xml

# mapred-site.xml
#   mapreduce.jobhistory.address
sed -i '/<name>mapreduce.jobhistory.address<\/name>/{n;s/.*/\t<value><sec_namenode_host_name>:10020<\/value>/;}' mapred-site.xml
#   mapreduce.jobhistory.webapp.address
sed -i '/<name>mapreduce.jobhistory.webapp.address<\/name>/{n;s/.*/\t<value><sec_namenode_host_name>:19888<\/value>/;}' mapred-site.xml

    
# yarn-site.xml
#   yarn.nodemanager.local-dirs
sed -i '/<name>yarn.nodemanager.local-dirs<\/name>/{n;s/.*/\t<value>\/bigdata\/data\/yarn\/local-dirs<\/value>/;}' yarn-site.xml
#   yarn.resourcemanager.resource-tracker.address
sed -i '/<name>yarn.resourcemanager.resource-tracker.address<\/name>/{n;s/.*/\t<value><sec_namenode_host_name>:8025<\/value>/;}' yarn-site.xml
#   yarn.resourcemanager.scheduler.address
sed -i '/<name>yarn.resourcemanager.scheduler.address<\/name>/{n;s/.*/\t<value><sec_namenode_host_name>:8030<\/value>/;}' yarn-site.xml
#   yarn.resourcemanager.address
sed -i '/<name>yarn.resourcemanager.address<\/name>/{n;s/.*/\t<value><sec_namenode_host_name>:8050<\/value>/;}' yarn-site.xml
#   yarn.resourcemanager.admin.address
sed -i '/<name>yarn.resourcemanager.admin.address<\/name>/{n;s/.*/\t<value><sec_namenode_host_name>:8141<\/value>/;}' yarn-site.xml
#   yarn.nodemanager.log-dirs
sed -i '/<name>yarn.nodemanager.log-dirs<\/name>/{n;s/.*/\t<value>\/bigdata\/data\/yarn\/log-dirs<\/value>/;}' yarn-site.xml

#   Login as root
#su root
#echo "<sec_namenode_host_name>" > /etc/hostname


# DNS for Namenode
#grep -q 'master1' /etc/hosts && sed -i "/master1/c\<ip>\tmaster1/" /etc/hosts || echo -e '<ip>\tmaster1' >> /etc/hosts
# DNS for secondary namenode
#grep -q 'master2' /etc/hosts && sed -i "/master2/c\<ip>\tmaster1/" /etc/hosts || echo -e '<ip>\tmaster2' >> /etc/hosts
# DNS For Datanodes
#grep -q 'slave1' /etc/hosts && sed -i "/slave1/c\<ip>\tmaster1/" /etc/hosts || echo -e '<ip>\tslave1' >> /etc/hosts
#grep -q 'slave2' /etc/hosts && sed -i "/slave2/c\<ip>\tmaster1/" /etc/hosts || echo -e '<ip>\tslave2' >> /etc/hosts
#grep -q 'slave3' /etc/hosts && sed -i "/slave3/c\<ip>\tmaster1/" /etc/hosts || echo -e '<ip>\tslave3' >> /etc/hosts

