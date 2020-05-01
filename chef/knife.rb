require 'etc'
knife.vault_mode = 'client'
knife.yes = true

# This can use an environment variable or can be hard-coded
$chef_server_url = ENV.fetch('CHEF_SERVER_URL', 'https://chefserver.coyhile.com/organizations')
$organization = ENV['CHEF_SERVER_ORG']
$organization = ENV.fetch('CHEF_SERVER_ORG','chlabs')
veriy_api_cert false
chef_server_url "#{$chef_server_url}/#{$organization}"
node_name Etc.getpwuid.name
client_key File.join(Dir.home, '.chef', "#{Etc.getpwuid.name}.pem")
