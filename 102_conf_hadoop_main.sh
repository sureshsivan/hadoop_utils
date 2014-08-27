#########################################################################################
## This script will setup the configuration for main node.
## For any other nodes, same configurations can be copied - rsync-ed
#########################################################################################
# Get Configurations
cd $HADOOP_CONF_DIR
wget https://s3.amazonaws.com/hadoop_util_files/hadoop_conf/conf.tar.gz
chmod +x conf.tar.gz
tar zxvf ~/conf.tar.gz -C ./
rm conf.tar.gz
chmod -R 744 .

#SEDing hadoop xml configs
# core-site.xml
#   fs.default.name
sed -i '/fs.default.name/{n;s/.*/\t<value>hdfs:\/\/master1:8020<\/value>/;}' core-site.xml
#   fs.checkpoint.dir
sed -i '/fs.checkpoint.dir/{n;s/.*/\t<value>\/bigdata\/data\/fs.checkpoint<\/value>/;}' core-site.xml
#   hadoop.tmp.dir
sed -i '/hadoop.tmp.dir/{n;s/.*/\t<value>\/bigdata\/data\/hadoop.tmp<\/value>/;}' core-site.xml

# hdfs-site.xml
#   dfs.name.dir
sed -i '/dfs.name.dir/{n;s/.*/\t<value>\/bigdata\/data\/dfs.name<\/value>/;}' hdfs-site.xml
#   dfs.data.dir
sed -i '/dfs.data.dir/{n;s/.*/\t<value>\/bigdata\/data\/dfs.data<\/value>/;}' hdfs-site.xml
#   dfs.http.address
sed -i '/dfs.http.address/{n;s/.*/\t<value>master2:50070<\/value>/;}' hdfs-site.xml
#   dfs.secondary.http.address
sed -i '/dfs.secondary.http.address/{n;s/.*/\t<value>master2:50090<\/value>/;}' hdfs-site.xml
#   dfs.https.address
sed -i '/dfs.https.address/{n;s/.*/\t<value>master2:50470<\/value>/;}' hdfs-site.xml

# mapred-site.xml
#   mapreduce.jobhistory.address
sed -i 'mapreduce.jobhistory.address/{n;s/.*/\t<value>master2:10020<\/value>/;}' mapred-site.xml
#   mapreduce.jobhistory.webapp.address
sed -i 'mapreduce.jobhistory.webapp.address/{n;s/.*/\t<value>master2:19888<\/value>/;}' mapred-site.xml

    
# yarn-site.xml
#   yarn.nodemanager.local-dirs
sed -i 'yarn.nodemanager.local-dirs/{n;s/.*/\t<value>\/bigdata\/data\/yarn\/local-dirs<\/value>/;}' yarn-site.xml
#   yarn.resourcemanager.resource-tracker.address
sed -i 'yarn.resourcemanager.resource-tracker.address/{n;s/.*/\t<value>master2:8025<\/value>/;}' yarn-site.xml
#   yarn.resourcemanager.scheduler.address
sed -i 'yarn.resourcemanager.scheduler.address/{n;s/.*/\t<value>master2:8030<\/value>/;}' yarn-site.xml
#   yarn.resourcemanager.address
sed -i 'yarn.resourcemanager.address/{n;s/.*/\t<value>master2:8050<\/value>/;}' yarn-site.xml
#   yarn.resourcemanager.admin.address
sed -i 'yarn.resourcemanager.admin.address/{n;s/.*/\t<value>master2:8141<\/value>/;}' yarn-site.xml
#   yarn.nodemanager.log-dirs
sed -i 'yarn.nodemanager.log-dirs/{n;s/.*/\t<value>\/bigdata\/data\/yarn\/log-dirs<\/value>/;}' yarn-site.xml
