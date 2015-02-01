#
# Cookbook Name:: php4.4
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# Install library


remote_file "#{node['php4']['src_dir']}#{node['php4']['file_name']}" do
  source "#{node['php4']['remote_uri']}"
end

remote_file "#{node['php4']['src_dir']}#{node['php4']['patch_name']}" do
  source "#{node['php4']['patch_uri']}"
end


bash "install php4" do
  user     node['php4']['install_user']
  cwd      node['php4']['src_dir']
  not_if   "ls #{node['php4']['dir']}/php"
  code   <<-EOH
    tar xzf #{node['php4']['file_name']}
    cd #{node['php4']['version']}
    mv -f #{node['php4']['src_dir']}/#{node['php4']['patch_name']} ext/openssl/
    ./configure #{node['php4']['configure']}
    make
    make install
    cp php.ini-recommended /usr/local/lib/php.ini
    echo 'LoadModule php4_module        modules/libphp4.so' >> #{node['apache']['dir']}/conf/httpd.cnf/
    #{node['apache']['dir']}/bin/apachectl restart
  EOH
end

