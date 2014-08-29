# Datanode node configuration
# Assumption is Hadoop is already configured and setup in datanode machine
#	  (https://github.com/v8-suresh/hadoop_utils/blob/master/100_setup_user_acc.sh)
#     (https://github.com/v8-suresh/hadoop_utils/blob/master/101_install_java_hadoop.sh)
# Login to namenode
[1]
ssh -i <key_file_path> hadoop@<namenode_host_name>;
[2]
more $HADOOP_CONF_DIR/masters;	\
echo "<sec_namenode_host_name>" > $HADOOP_CONF_DIR/slaves;	\
more /etc/hosts;	
[3]
su root;
[4]
grep -q '<datanode_host_name>' /etc/hosts && sed -i "/<datanode_host_name>/c\<datanode_ip>\t<datanode_host_name>/" /etc/hosts || echo -e '<sec_namenode_ip>\t<datanode_host_name>' >> /etc/hosts;	\
echo "Host <datanode_host_name>" >> ~/.ssh/config;	\
echo "IdentityFile ~/.ssh/<key_file_name>" >> ~/.ssh/config;	
[5]
ssh <datanode_host_name>;

# rsync conf from namenode to secondary namenode
[6]
rsync -avz -e "ssh" "$HADOOP_CONF_DIR/" "hadoop@<sec_namenode_host_name>:$HADOOP_CONF_DIR/";	\
rsync -avz -e "ssh" "$HADOOP_CONF_DIR/" "hadoop@<datanode_host_name>:$HADOOP_CONF_DIR/";
[7]
exit

#	Login to Secondary namenode
[8]
ssh -i <key_file_path> hadoop@<sec_namenode_host_name>;
[9]
su root;
[10]
grep -q '<namenode_host_name>' /etc/hosts && sed -i "/<namenode_host_name>/c\<namenode_ip>\t<sec_namenode_host_name>/" /etc/hosts || echo -e '<namenode_ip>\t<namenode_host_name>' >> /etc/hosts;	\
grep -q '<sec_namenode_host_name>' /etc/hosts && sed -i "/<sec_namenode_host_name>/c\<sec_namenode_ip>\t<sec_namenode_host_name>/" /etc/hosts || echo -e '<sec_namenode_ip>\t<sec_namenode_host_name>' >> /etc/hosts;	\
grep -q '<datanode_host_name>' /etc/hosts && sed -i "/<datanode_host_name>/c\<datanode_ip>\t<datanode_host_name>/" /etc/hosts || echo -e '<sec_namenode_ip>\t<datanode_host_name>' >> /etc/hosts;
