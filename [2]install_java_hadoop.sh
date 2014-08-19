ssh -i <key_file_path> root@<ip_address>
mkdir /root/tmp
mkdir /bigdata
mkdir /bigdata/tmp
chown -R /bigdata hadoop:hadoop

# Download JDK in local
scp -i <java_file_path> <key_file_path> hadoop@<ip_address>:/bigdata/tmp
ssh -i <key_file_path> hadoop@<ip_address>
cd /bigdata/tmp
ls -la
chmod +x *.*
./<bin_file_name>




su root
chown -R /bigdata hadoop:hadoop
