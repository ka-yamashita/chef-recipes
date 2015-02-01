#
# Cookbook Name:: yum-base
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
service "iptables" do
    action [:stop, :disable]
end

%w{gcc flex openssl openssl-devel mysql-server mysql autoconf ntp patch}.each do |p|
    package p do
        action :install
    end
end
service "ntpd" do
  supports status: true, restart: true
  action [:enable, :start]
end

