
set :stage, :production
set :branch, 'main' ## 必要があれば変更

server '118.27.9.129', user: 'localadmin', roles: %w{app db web}, port: 55555

set :ssh_options, {
  port: 55555, #### 変更
  keys: [File.expand_path('~/.ssh/conoha/id_rsa')], # リモートサーバー用秘密鍵があるところを指定
  forward_agent: true,
  auth_methods: %w(publickey)
}