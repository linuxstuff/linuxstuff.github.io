# HEAT, the OpenStack Orchestration 

## What is it and how it works

 * OpenStack provides an Infrastructure as a Service (IaaS) solution through a set of **interrelated services**


 * orchestration engine, to launch composite could applications
 * it uses text files, that can be treated like code
 * a heat template will describe the infrastructure for a cloud application
 * the heat text file will be created by the cloud user (a human)
 * a heat template can contain: servers, ips, volumes, security groups
 * integrates with the OpenStack Ceilometer , to provide autoscaling
 * able to declare dependencies between resources 
 * integration with Chef and Puppet
 * provides OpenStack-native REST API and CloudFormation-compatible Query API
 * python applications: heat - CLI, heat-api - OpenStack-native REST API , heat-api-cfn - AWS-style Query API, heat-engine

 * heat text file example: https://github.com/openstack/heat-templates/commit/934233a0a69f7144e8d894ef36ef4569996778ad

 * OpenStack Architecture : http://docs.openstack.org/havana/install-guide/install/apt/content/ch_overview.html#conceptual-architecture


 * the Orchestration service is integrated in the OpenStack 

***
