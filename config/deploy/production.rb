server '118.27.9.129', user: 'localadmin', roles: %w{app db web}, port: 55555 
set :ssh_options, keys: '~/.ssh/conoha/id_rsa'
