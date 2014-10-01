# Chef ...

 **ignore_failure during converge phase**
 >     gem_package "syntax" do
 >       action :install
 >       ignore_failure true
 >     end

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
 
 **Notifies
 >     template "/etc/nagios3/configures-nagios.conf" do
 >     	# other parameters
 >     	notifies :run, "execute[test-nagios-config]", :immediately
 >     end 
 * the execute resource will be triggered after the template resource is executed. 
 >     execute "test-nagios-config" do
 >      command "nagios3 --verify-config"
 >      action :nothing
 >     end


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
