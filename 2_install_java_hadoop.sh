##################################################################################
####  First Machine  -  NAMENODE
##################################################################################
ssh -i <key_file_path> root@<ip_address>
mkdir /root/tmp
# All Higher level directories
mkdir /bigdata  /bigdata/tmp /bigdata/apps  /bigdata/data /bigdata/conf /bigdata/logs

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


chown -R /bigdata hadoop:hadoop
exit

ssh -i <key_file_path> hadoop@<ip_address>:/bigdata
ls -la  # To Check ownership
tar -zxvf hadoop-1.2.1.tar.gz
tar -zxvf hadoop-2.4.1.tar.gz
# Create Lower Level Directories for Hadoop Eco System to run
mkdir /bigdata/data/dfs.data  /bigdata/data/dfs.name  /bigdata/data/fs.checkpoint /bigdata/data/hadoop.tmp  
mkdir /bigdata/data/yarn  /bigdata/data/yarn/local-dirs /bigdata/data/yarn/log-dirs
mkdir /bigdata/conf.pseudo  /bigdata/conf.local /bigdata/conf.tmp

