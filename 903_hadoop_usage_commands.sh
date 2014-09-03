[1]
$HADOOP_PREFIX/bin/hdfs dfsadmin -report

[2]
$HADOOP_PREFIX/bin/hadoop fs -ls
$HADOOP_PREFIX/bin/hadoop fs -ls /
$HADOOP_PREFIX/bin/hadoop fs -ls -R /
$HADOOP_PREFIX/bin/hadoop fs -ls -R hdfs://master1:8020/

[3]
$HADOOP_PREFIX/bin/hadoop fs -mkdir hdfs://master1:8020/test1
$HADOOP_PREFIX/bin/hadoop fs -mkdir /test2

$HADOOP_PREFIX/bin/hadoop fs -mkdir hdfs://master1:8020/study/
$HADOOP_PREFIX/bin/hadoop fs -mkdir hdfs://master1:8020/study/hadoopbook/
$HADOOP_PREFIX/bin/hadoop fs -mkdir hdfs://master1:8020/study/hadoopbook/ncdc/
$HADOOP_PREFIX/bin/hadoop fs -mkdir hdfs://master1:8020/study/hadoopbook/ncdc/all


[4]
$HADOOP_PREFIX/bin/hadoop distcp \
  -Dfs.s3n.awsAccessKeyId='' \
  -Dfs.s3n.awsSecretAccessKey='' \
  s3n://hadoopbook/ncdc/all \
  hdfs://master1:8020/study/hadoopbook/ncdc/all;


$HADOOP_PREFIX/bin/
$HADOOP_PREFIX/bin/
$HADOOP_PREFIX/bin/
$HADOOP_PREFIX/bin/
