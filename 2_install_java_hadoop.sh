ssh -i <key_file_path> root@<ip_address>
mkdir /root/tmp
mkdir /bigdata
mkdir /bigdata/tmp
mkdir /bigdata/apps
mkdir /bigdata/data
mkdir /bigdata/conf
mkdir /bigdata/logs
# have oracle deb in current directory
dpkg -i oracle-j2sdk1.6_1.6.0+update31_amd64.deb
# Have all tar.gz files in /bigdata/tmp/
cp /bigdata/tmp/*.tar.gz /bigdata/apps/
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
