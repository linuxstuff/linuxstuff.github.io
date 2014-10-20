# Chef resources ...

 **ignore_failure during converge phase**
 >     gem_package "syntax" do
 >       action :install
 >       ignore_failure true
 >     end

 ***

 **Use the supports and providers common attributes**
 >     service "some_service" do
 >      provider Chef::Provider::Service::Upstart
 >      supports :status => true, :restart => true, :reload => true
 >      action [ :enable, :start ]
 >     end
 * specify a given provider for service using short or long name approach 

 ***

 **Guards example** 
 >     template "/tmp/somefile" do
 >       mode '0644'
 >       source "somefile.erb"
 >       not_if do
 >         File.exists?("/etc/passwd")
 >       end
 >     end

 ***

 **Lazy Attribute Evaluation**
 >     template "template_name" do
 >      path lazy { " some Ruby code " }
 >     end
 * the Ruby code will be evaluated in the execution phase

 *** 
 
 **Notifies**
 >     template "/etc/nagios3/configures-nagios.conf" do
 >     	# other parameters
 >     	notifies :run, "execute[test-nagios-config]", :immediately
 >     end 
 >
 >     execute "test-nagios-config" do
 >      command "nagios3 --verify-config"
 >      action :nothing
 >     end
 > * the execute resource will be triggered after the template resource is executed.

 ***

 **Subscribe**
 >     template "/tmp/somefile" do
 >      mode '0644'
 >      source "somefile.erb"
 >     end
 >
 >     service "apache" do
 >      supports :restart => true, :reload => true
 >      action :enable
 >      subscribes :reload, "template[/tmp/somefile]", :immediately
 >     end 
 * service apache resource will be triggered each time when template "/tmp/somefile" is executed

 ***
 
 **Run Resources from the Resource Collection**
 
 * Run a resource before all other resources are added to the resource collection and/or after all resources have been added, but before the chef-client configures the system.
 * Run before other resources
 >
 >     e = execute "apt-get update" do
 >      action :nothing
 >     end
 >     e.run_action(:run)
 >

 * To run a resource at the end of the resource collection phase of the chef-client run, use the :delayed timer on a notification.

 ***

 **Steps in chef-cliet run**

 * http://docs.getchef.com/essentials_nodes_chef_run.html 
 * **Get configuration data**:  local client.rb file + ohai 
 * **Authenticate to the Chef Server**: RSA priv key + node name against chef API
 * **Get, rebuild the node object**: node object is rebuild 
 * **Expand the run-list**: ..
 * **Synchronize cookbooks**: gets the list of cookbooks, compare with existing files in cache. Chef client is able to request the cookbooks at the beginning
 * **Reset node attributes**: All attributes in the rebuilt node object are updated with the attribute data according to attribute precedence
 * **Compile the resource collection**: "The chef-client identifies each resource in the node object and builds the resource collection....Finally, all recipes are loaded in the order specified by the expanded run-list." 
 * **Converge the node**: "Each resource is executed in the order identified by the run-list, and then by the order in which each resource is listed in each recipe."
 * **Update the node object, process exception and report handlers**: "chef-client updates the node object on the Chef server with the node object that was built during this chef-client run...exception and report handlers are executed"
 * **Stop, wait for the next run** 

 ***

# Resources that are build in

 * apt_package
 * bash
 * batch , for windows 
 * breakpoint , add breakpoints to recipes, then run the chef-client in chef-shell mode.
 * chef_gem, install a gem only for the instance of Ruby that is dedicated to the chef-client. It is done before convergence, allowing a gem to be used in a recipe immediately after it is installed.
 * chef_handler , types: start(in config.rb), report(by chef_handler), error (by chef_handler or config.rb) 
 * cookbook_file ,  transfer files from a sub-directory of COOKBOOK_NAME/files/ 
 >      cookbook_file "application.pm" do 
 >        path case node['platform']
 >          when "centos","redhat"
 >           "/usr/lib/version/1.2.3/dir/application.pm"
 >          when "arch"
 >           "other file"
 >          else
 >           "other file"
 >          end
 >        source "application-#{node['languages']['perl']['version']}.pm"
 >        owner 'root'
 >        ...
 >      end 
