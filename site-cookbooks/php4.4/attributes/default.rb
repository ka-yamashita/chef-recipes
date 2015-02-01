default['php4']['version']    = "php-4.4.9"

## File
default['php4']['file_name'] = "#{default['php4']['version']}.tar.gz"
default['php4']['remote_uri'] = "http://museum.php.net/php4/#{default['php4']['file_name']}"

default['php4']['patch_name'] = "openssl.c"
default['php4']['patch_uri'] = "http://www.softel.co.jp/blogs/tech/wordpress/wp-content/uploads/2012/10/#{default['php4']['patch_name']}"
## Directory
default['php4']['src_dir'] = "/usr/local/src/"
default['php4']['dir'] = "/usr/local"

## User
default['php4']['install_user']  = "root"
default['php4']['install_group'] = "root"

## Configure Options
default['php4']['configure']  = " --prefix=#{default['php4']['dir']} --with-apxs2=/usr/local/apache2/bin/apxs  --with-openssl --enable-mbstring"

default['apache']['dir']     = "/usr/local/apache2"
