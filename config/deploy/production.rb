server '160.251.55.78', user: 'localadmin', roles: %w{app db web}, port: 55555 
set :ssh_options, keys: '~/.ssh/id_rsa'