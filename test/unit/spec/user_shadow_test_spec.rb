require_relative 'spec_helper'
require_relative 'options'

OS_OPTS.each do |n, vers|
  vers.each do |v|
    describe "user_shadow_test::default on #{n} #{v}" do
      before do
        stub_resources
      end

      cached(:chef_run) do
        ChefSpec::SoloRunner.new(
          {
            log_level: LOG_LEVEL,
            platform: n.to_s,
            version: v,
          }.freeze
        ) do |node|
          node_resources(node)
        end.converge('user_shadow_test::default')
      end

      it_behaves_like 'testuser'
    end
  end
end
