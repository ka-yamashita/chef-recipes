#! /bin/sh
##
## Download thirdparty cookbooks under ./cookbooks using Berksfile.
##
if [ -d ./cookbooks ];then
    echo "Removing existing cooksbooks"
      rm -rf ./cookbooks
      fi
      berks vendor ./cookbooks
