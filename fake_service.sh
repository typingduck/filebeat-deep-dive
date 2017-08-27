#!/usr/bin/env bash
#
# Simulates a running program writing logs with a java stacktrace
#


while [[ 1 ]]
do
cat <<END
sing CATALINA_BASE:   /usr/local/tomcat
Using CATALINA_HOME:   /usr/local/tomcat
Using CATALINA_TMPDIR: /usr/local/tomcat/temp
Using JRE_HOME:        /docker-java-home
Using CLASSPATH:       /usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat/bin/tomcat.jar
Listening for transport dt_socket at address: 5005
2014-11-23 23:25:22,119 INFO org.apache.hadoop.mapred.MapTask: record buffer = 262144/327680
2014-11-23 23:25:22,222 INFO org.apache.hadoop.mapred.TaskLogsTruncater: Initializing logs' truncater with mapRetainSize=-1 and reduceRetainSize=-1
2014-11-23 23:25:22,481 WARN org.apache.hadoop.mapred.Child: Error running child
java.lang.NullPointerException
    at org.apache.hadoop.io.serializer.SerializationFactory.getSerializer(SerializationFactory.java:73)
    at org.apache.hadoop.mapred.MapTask$MapOutputBuffer.<init>(MapTask.java:970)
    at org.apache.hadoop.mapred.MapTask$NewOutputCollector.<init>(MapTask.java:673)
    at org.apache.hadoop.mapred.MapTask.runNewMapper(MapTask.java:756)
    at org.apache.hadoop.mapred.MapTask.run(MapTask.java:364)
    at org.apache.hadoop.mapred.Child$4.run(Child.java:255)
    at java.security.AccessController.doPrivileged(Native Method)
    at javax.security.auth.Subject.doAs(Subject.java:394)
    at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1190)
    at org.apache.hadoop.mapred.Child.main(Child.java:249)
Caused by: java.lang.NullPointerException
    at org.apache.hadoop.io.serializer.SerializationFactory.getSerializer(SerializationFactory.java:73)
    at org.apache.hadoop.mapred.MapTask$MapOutputBuffer.<init>(MapTask.java:970)
    at org.apache.hadoop.mapred.MapTask$NewOutputCollector.<init>(MapTask.java:673)
    at org.apache.hadoop.mapred.MapTask.runNewMapper(MapTask.java:756)
    at org.apache.hadoop.mapred.MapTask.run(MapTask.java:364)
    at org.apache.hadoop.mapred.Child$4.run(Child.java:255)
    at java.security.AccessController.doPrivileged(Native Method)
    at javax.security.auth.Subject.doAs(Subject.java:394)
    at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1190)
    at org.apache.hadoop.mapred.Child.main(Child.java:249)
2014-11-23 23:25:22,485 INFO org.apache.hadoop.mapred.Task: Runnning cleanup for the task
END
  sleep 5
done
