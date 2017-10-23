require 'chefspec'
require 'chefspec/berkshelf'
require_relative 'user_shadow_shared'

cll = ENV['CHEFSPEC_LOG_LEVEL'] || false
::LOG_LEVEL = cll ? cll.to_sym : :fatal

def stub_resources; end

def node_resources(_node); end

at_exit { ChefSpec::Coverage.report! }
