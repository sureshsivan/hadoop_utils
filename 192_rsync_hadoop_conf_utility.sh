# To sync up hadoop configuration acroos all nodes in cluster
# All nodes will be synced up from namenode hadoop configuration
# Run this from namenode
rsync -avz -e "ssh" "$HADOOP_CONF_DIR/" "hadoop@<sec_namenode_host_name>:$HADOOP_CONF_DIR/"
# Run beow for every datanode
  rsync -avz -e "ssh" "$HADOOP_CONF_DIR/" "hadoop@<datanode_host_name>:$HADOOP_CONF_DIR/"
