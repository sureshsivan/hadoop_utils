## Not working as expected - To tweak
hosts=(<namenode> <sec_namenode> <datanode_1> <datanode_n>);	\
ips=(<namenode_ip> <sec_namenode_ip> <datanode_1_ip> <datanode_n_ip>);	\
n=${#ips[*]}; for((i=0; i<n; i++)); \
do grep -q '${hosts[i]}' /etc/hosts && sed -i "/S{hosts[i]}/c\${ips[i]} ${hosts[i]}/" /etc/hosts || echo -e "${ips[i]} ${hosts[i]}" >> /etc/hosts
done;
