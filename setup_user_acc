#############################################################
##	This is the utility script to setup a user for hadoop and
##	public key access to localhost in a Ec2 Ubuntu instance
#############################################################
ssh -i <key_file_path> ubuntu@<ip_address>
# Create password for root
sudo passwd

exit

ssh -i <key_file_path> root@<ip_address>
# as [root]
mkdir /root/.ssh
touch authorized_keys
cat /home/ubuntu/.ssh/authorized_keys > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
exit

ssh -i <key_file_path> root@<ip_address>
# as [root]
useradd -g hadoop -m hadoop -s /bin/bash
passwd hadoop
mkdir /home/hadoop/.ssh
touch /home/hadoop/.ssh/authorized_keys
cat /home/ubuntu/.ssh/authorized_keys > /home/hadoop/.ssh/authorized_keys
more /home/hadoop/.ssh/authorized_keys
ls -la /home/hadoop/.ssh
chown -R hadoop:hadoop /home/hadoop/.ssh
ls -la /home/hadoop/.ssh
exit


# From Client
ssh -i <key_file_path> hadoop@<ip_address>
ls -la /home/hadoop/.ssh
chmod 600 /home/hadoop/.ssh/authorized_keys
ls -la /home/hadoop/.ssh
ssh-keygen
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys"
ssh hadoop@localhost
exit
exit
