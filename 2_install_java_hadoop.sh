##################################################################################
####  First Machine
##################################################################################
ssh -i <key_file_path> root@<ip_address>
mkdir /root/tmp
mkdir /bigdata
mkdir /bigdata/tmp
mkdir /bigdata/apps
mkdir /bigdata/data
mkdir /bigdata/conf
mkdir /bigdata/logs

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


