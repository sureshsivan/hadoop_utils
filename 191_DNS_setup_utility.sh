# To setup DNS resolution in all nodes of cluster
# No need to exucute this for namenode - as namenode will be properly configured when adding additional nodes.
# This is useful if in case host ip addresses are changing.
####  Execute from Secondary namenode
ssh -i <key_file_path> root@<sec_namenode_host_name>
grep -q '<namenode_host_name>' /etc/hosts && sed -i "/<namenode_host_name>/c\<namenode_ip>\t<namenode_host_name>/" /etc/hosts || echo -e '<sec_namenode_ip>\t<sec_namenode_host_name>' >> /etc/hosts
grep -q '<sec_namenode_host_name>' /etc/hosts && sed -i "/<sec_namenode_host_name>/c\<sec_namenode_ip>\t<sec_namenode_host_name>/" /etc/hosts || echo -e '<sec_namenode_ip>\t<sec_namenode_host_name>' >> /etc/hosts
# Execute this for every datanodes in cluster - If there are 3 data nodes, then this must be run for 3 times
  grep -q '<datanode_host_name>' /etc/hosts && sed -i "/<datanode_host_name>/c\<datanode_ip>\t<datanode_host_name>/" /etc/hosts || echo -e '<sec_namenode_ip>\t<datanode_host_name>' >> /etc/hosts
  
##  Execute from Every Data nodes
ssh -i <key_file_path> root@<sec_namenode_host_name>
grep -q '<namenode_host_name>' /etc/hosts && sed -i "/<namenode_host_name>/c\<namenode_ip>\t<namenode_host_name>/" /etc/hosts || echo -e '<sec_namenode_ip>\t<sec_namenode_host_name>' >> /etc/hosts
grep -q '<sec_namenode_host_name>' /etc/hosts && sed -i "/<sec_namenode_host_name>/c\<sec_namenode_ip>\t<sec_namenode_host_name>/" /etc/hosts || echo -e '<sec_namenode_ip>\t<sec_namenode_host_name>' >> /etc/hosts
# Execute this for every datanodes in cluster - If there are 3 data nodes, then this must be run for 3 times
  grep -q '<datanode_host_name>' /etc/hosts && sed -i "/<datanode_host_name>/c\<datanode_ip>\t<datanode_host_name>/" /etc/hosts || echo -e '<sec_namenode_ip>\t<datanode_host_name>' >> /etc/hosts
  
