#############################################################
##	This is the utility script to setup a user for hadoop and
##	public key access to localhost in a Ec2 Ubuntu instance
#############################################################
[1]	
ssh -i <key_file_path> ubuntu@<ip_address>;
# Create password for root
[2]	
sudo passwd;
[3]	
su root;
# as [root]
[4]	
echo "<host_name>" > /etc/hostname;	\
grep -q '<host_name>' /etc/hosts && sed -i "/<host_name>/c\<ip>\t<host_name>/" /etc/hosts || echo -e '<ip>\t<host_name>' >> /etc/hosts;	\
mkdir -p /root/.ssh;	\
touch authorized_keys;	\
cat /home/ubuntu/.ssh/authorized_keys > /root/.ssh/authorized_keys;	\
chmod 600 /root/.ssh/authorized_keys;
[5]
exit;

[6]
ssh -i <key_file_path> root@<ip_address>;
# as [root]
[7]
groupadd hadoop;	\
useradd -g hadoop -m hadoop -s /bin/bash;
[8]
passwd hadoop;
[9]
mkdir /home/hadoop/.ssh;	\
touch /home/hadoop/.ssh/authorized_keys;	\
cat /home/ubuntu/.ssh/authorized_keys > /home/hadoop/.ssh/authorized_keys;	\
more /home/hadoop/.ssh/authorized_keys;	\
ls -la /home/hadoop/.ssh;	\
chown -R hadoop:hadoop /home/hadoop/.ssh;	\
ls -la /home/hadoop/.ssh;	\
[10]
exit;

[11]
scp -i <key_file_path> <key_file_path> hadoop@<host_name>:/home/hadoop/.ssh/;
[12]
ssh -i <key_file_path> hadoop@<ip_address>;
[13]
touch ~/.ssh/config;	\
chmod 600 ~/.ssh/config;	\
echo "Host localhost" > ~/.ssh/config;	\
echo "IdentityFile ~/.ssh/<key_file_name>" >> ~/.ssh/config;	\
echo "Host <host_name>" >> ~/.ssh/config;	\
echo "IdentityFile ~/.ssh/<key_file_name>" >> ~/.ssh/config;

[14]
ssh localhost;

[15]
ssh <host_name>;
