# This page contains small chef defitions or code...  

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

 **Steps in chef-cliet run**
 
 * Get configuration data:  local client.rb file + ohai 
 * Authenticate to the Chef Server: RSA priv key + node name against chef API
 * Get, rebuild the node object: node object is rebuild 
 * Expand the run-list: ..
 * Synchronize cookbooks: gets the list of cookbooks, compare with existing files in cache. Chef client is able to request the cookbooks at the beginning
 * Reset node attributes: All attributes in the rebuilt node object are updated with the attribute data according to attribute precedence
 * **Compile the resource collection**: "The chef-client identifies each resource in the node object and builds the resource collection....Finally, all recipes are loaded in the order specified by the expanded run-list."  
