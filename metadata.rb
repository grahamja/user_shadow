# Encoding: utf-8

name 'user_shadow'
maintainer 'Rackspace'
maintainer_email 'rackspace-cookbooks@rackspace.com'
license 'Apache 2.0'
description 'Provides a resource to modify shadow attributes for a user'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.6'

supports 'centos'
supports 'ubuntu'

chef_version '>= 12.5.1' if respond_to?(:chef_version)
issues_url 'https://github.com/rackspace-cookbooks/user_shadow/issues' if respond_to?(:issues_url)
source_url 'https://github.com/rackspace-cookbooks/user_shadow' if respond_to?(:source_url)
