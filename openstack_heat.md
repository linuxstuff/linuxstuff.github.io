# HEAT, the OpenStack Orchestration 

## What is it and how it works

 * orchestration engine, to launch composite could applications
 * it uses text files, that can be treated like code
 * a heat template will describe the infrastructure for a cloud application
 * the heat text file will be created by the cloud user (a human)
 * a heat template can contain: servers, ips, volumes, security groups
 * integrates with the OpenStack Ceilometer , to provide autoscaling
 * able to declare dependencies between resources 
 * integration with Chef and Puppet
 * provides OpenStack-native REST API and CloudFormation-compatible Query API

***
