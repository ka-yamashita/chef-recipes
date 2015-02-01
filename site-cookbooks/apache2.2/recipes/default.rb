# Install library
#include_recipe "apache::lib"


# Get source file
remote_file "#{node['apache']['src_dir']}#{node['apache']['file_name']}" do
  source "#{node['apache']['remote_uri']}"
end

# Bashs
execute "start apache" do
  command "#{node['apache']['dir']}/bin/apachectl start"
  action :nothing
end

execute "restart apache" do
  command "#{node['apache']['dir']}/bin/apachectl restart"
  action :nothing
end

# Install Apache
bash "install apache" do
  user     node['apache']['install_user']
  cwd      node['apache']['src_dir']
  not_if   "ls #{node['apache']['dir']}"
  notifies :run, 'execute[start apache]', :immediately
  code   <<-EOH
    tar xzf #{node['apache']['file_name']}
    cd #{node['apache']['version']}
    ./configure #{node['apache']['configure']}
    make
    make install
  EOH
end


# Modify conf
template "#{node['apache']['dir']}/conf/httpd.conf" do
  source   "httpd.conf.erb"
  owner    node['apache']['install_user']
  group    node['apache']['install_group']
  mode     00644
  notifies :run, 'execute[restart apache]', :immediately
end

