On debian:
-- systemv is in use 
-- migrating to upstart is wanted 
-- when issue chef-server-crl reconfigure, this is the command it runs: 
   chef-solo -c /opt/opscode/embedded/cookbooks/solo.rb -j /opt/opscode/embedded/cookbooks/dna.json
   recipe[private-chef::default] -- has this include: include_recipe "enterprise::runit"
   the  "enterprise::runit" recipe is using rinit_upstart for debian
   just CHANGE THIS :include_recipe 'enterprise::runit_upstart' to THIS: include_recipe 'enterprise::runit_sysvinit' IN: /opt/opscode/embedded/cookbooks/enterprise/recipes/runit.rb

