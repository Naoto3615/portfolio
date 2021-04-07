# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "portfolio"
set :repo_url, "git@github.com:Naoto3615/portfolio.git"
set :branch, "main"

set :deploy_to, '/var/www/portfolio' # デプロイ先

set :rbenv_type, :user  # rbenvをシステムにインストールした or ユーザーローカルにインストールした
set :rbenv_ruby, '3.0.0' # サーバで利用するrubyのバージョンを指定
set :rbenv_path, '/home/localadmin/.rbenv'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"

# リリースフォルダをいくつまで保持するか？
set :keep_releases, 5
set :deploy_via, :remote_cache

set :log_level, :debug # capistranoの出力ログの制御
set :pty, true # sudoを使用するのに必要

set :yarn_flags, "--ignore-engines --prefer-offline --production --no-progress"
set :yarn_roles, :all
set :yarn_env_variables, {}

# Shared に入るものを指定
set :linked_files, %w{config/database.yml config/secrets.yml} # シンボリックリンクを貼るファイル
set :linked_dirs,  %w{log tmp/pids tmp/sockets tmp/cache vender/bundle } # sharedにシンボリックリンクを張るディレクトリ指定

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do


 desc 'Restart application'
  # アプリ再起動を行うタスク
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :mkdir, '-p', release_path.join('tmp')
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  # linked_files で使用するファイルをアップロードするタスク
  # deployが行われる前にコマンドにて実行する
  desc 'upload important files'
  task :upload do
    on roles(:app) do |host|
      execute :mkdir, '-p', "#{shared_path}/config"
      upload!('config/database.yml',"#{shared_path}/config/database.yml")
      upload!('config/secrets.yml',"#{shared_path}/config/secrets.yml")
    end
  end

  # webサーバー再起動時にキャッシュを削除する
  after :restart, :clear_cache do
   on roles(:web), in: :groups, limit: 3, wait: 10 do
    #Here we can do anything such as:
    within release_path do
      execute :rm, '-rf', release_path.join('tmp/cache')
    end
   end
  end
  # Flow の before, after のタイミングで上記タスクを実行
  before :started,   'deploy:upload'
  after  :finishing, 'deploy:cleanup'

  #unicorn 再起動タスク
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart' # lib/capustrano/tasks/unicorn.rake 内処理を呼び出す
  end
end