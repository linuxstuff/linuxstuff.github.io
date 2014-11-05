# HEAT, the OpenStack Orchestration 

## What is it and how it works

 * OpenStack provides an Infrastructure as a Service (IaaS) solution through a set of **interrelated services** . Supports KVM, XenServer and LXC as hypervisor technology.


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

 * heat text file example: [Heat Text File Example](https://github.com/openstack/heat-templates/commit/934233a0a69f7144e8d894ef36ef4569996778ad)

 * OpenStack Architecture (**architecture image**): [Architecture Image](http://docs.openstack.org/havana/install-guide/install/apt/content/ch_overview.html#conceptual-architecture)
 
 * the Orchestration service is integrated within the OpenStack software tools and works with the OpenStack API

***

##Configuration Examples:

 * /etc/heat/heat.conf
 >      verbose = True
 >      log_dir=/var/log/heat
 >      rabbit_host = controller
 >      rabbit_password = RABBIT_PASS
 >      auth_host = controller
 >      auth_port = 35357
 >	auth_protocol = http
 >	auth_uri = http://controller:5000/v2.0
 >	admin_tenant_name = service
 > 	admin_user = heat
 >	admin_password = HEAT_PASS
 >	[ec2_authtoken]
 >	auth_uri = http://controller:5000/v2.0
 >	keystone_ec2_uri = http://controller:5000/v2.0/ec2tokens

## OpenStack keystone commands to enable the HEAT Orchestration Service


 * **keystone user-create --name=heat --pass=HEAT_PASS --email=heat@example.com**
 * **keystone user-role-add --user=heat --tenant=service --role=admin**
 * **keystone service-create --name=heat --type=orchestration --description="Heat Orchestration API"**
 * **keystone endpoint-create --service-id=the_service_id_above --publicurl=http://controller:8004/v1/%\(tenant_id\)s --internalurl=http://controller:8004/v1/%\(tenant_id\)s --adminurl=http://controller:8004/v1/%\(tenant_id\)s**
 * **keystone service-create --name=heat-cfn --type=cloudformation --description="Heat CloudFormation API"**
 * **keystone endpoint-create --service-id=the_service_id_above --publicurl=http://controller:8000/v1 --internalurl=http://controller:8000/v1 --adminurl=http://controller:8000/v1**


## Heat commands

 * **heat stack-create mystack --template-file=/PATH_TO_HEAT_TEMPLATES/WordPress_Single_Instance.template**
 * **heat stack-list**
 * **heat stack-show mystack**


