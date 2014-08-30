hosts=(<hostname1> ... <hostnamen>);\
for host in "${hosts[@]}";\
do  rsync -avz -e "ssh" "$HADOOP_CONF_DIR/" "hadoop@$host:$HADOOP_CONF_DIR/"
done;
