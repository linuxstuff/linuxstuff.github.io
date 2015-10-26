# Start VisualGC  

 **We need jstatd to run on the jvm machine**

 * create a policy file somewhere: vim jstatd.all.policy
 * identify the java process: jps
 * start the jstatd daemon: jstatd -p 31498 -J-Djava.security.policy=/home/cristi/jstatd.all.policy
 * jstatd.all.policy content, below:
 > grant codebase \"file:${java.home}/../lib/tools.jar\" {
 > permission java.security.AllPermission;
 > };
 
***
