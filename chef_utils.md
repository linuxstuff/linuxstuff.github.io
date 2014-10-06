# Chef utils

 **Change chef-server-webui settings in chef 11**

 * go to file: /opt/chef-server/embedded/cookbooks/chef-server/attributes/default.rb
 * search for *default['chef_server']['chef-server-webui']['listen']* and change it 
 * or you use iptables to redirect traffic to port 9462
