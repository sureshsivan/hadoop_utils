# Sync up hosts
# Do this setup in client
su root;
sed -i '/HADOOP/q;p' /etc/hosts;\
hosts=("master1" "master2" "slave1" "slave2" "slave3");\
ips=("1" "2" "3" "4" "5");\
n=${#ips[*]};\
for((i=0;i<n;i++));\
do echo -e "${ips[i]} ${hosts[i]}" >> /etc/hosts;\
done;

# Find Private ip of all the hosts
ssh -i HadoopEcoSystem.pem root@master1 ifconfig eth0 | awk '/inet addr/{print substr($2,6)}';\
ssh -i HadoopEcoSystem.pem root@master2 ifconfig eth0 | awk '/inet addr/{print substr($2,6)}';\
ssh -i HadoopEcoSystem.pem root@slave1 ifconfig eth0 | awk '/inet addr/{print substr($2,6)}';\
ssh -i HadoopEcoSystem.pem root@slave2 ifconfig eth0 | awk '/inet addr/{print substr($2,6)}';\
ssh -i HadoopEcoSystem.pem root@slave3 ifconfig eth0 | awk '/inet addr/{print substr($2,6)}';

# Do this after logging into every hosts
sed -i '/HADOOP/q;p' /etc/hosts;\
hosts=("master1" "master2" "slave1" "slave2" "slave3");\
ips=("1" "2" "3" "4" "5");\
n=${#ips[*]};\
for((i=0;i<n;i++));\
do echo -e "${ips[i]} ${hosts[i]}" >> /etc/hosts;\
done;


# Sync up hadoop configuration
rsync -avz -e "ssh" "$HADOOP_CONF_DIR/" "hadoop@master2:$HADOOP_CONF_DIR/"
rsync -avz -e "ssh" "$HADOOP_CONF_DIR/" "hadoop@slave1:$HADOOP_CONF_DIR/"
rsync -avz -e "ssh" "$HADOOP_CONF_DIR/" "hadoop@slave2:$HADOOP_CONF_DIR/"
rsync -avz -e "ssh" "$HADOOP_CONF_DIR/" "hadoop@slave3:$HADOOP_CONF_DIR/"

rsync -avz --stats -e "ssh -i HadoopEcoSystem.pem" "hadoop@master1:/bigdata/conf/hadoop/" "/dev_tools/tools/hadoop/conf/conf.ec2"


............
