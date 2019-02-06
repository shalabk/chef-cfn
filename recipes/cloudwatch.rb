# Install Chef-Run handlers
#

path = ::File.join('/var/chef/handler', 'cloudwatch_event.rb')

directory path

cookbook_file path do
  source 'chef_handlers/cloudwatch_event.rb'
  mode '0644'
end

chef_handler 'CFN::CloudWatchEventHandler' do
  source path
  arguments lazy {
    {
      region: node['cfn']['vpc']['region_id'],
      config: node['cfn']['cloudwatch'].to_hash
    }
  }
end
