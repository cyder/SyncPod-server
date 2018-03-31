# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, "syncpod"
set :repo_url, "git@github.com:Mori-Atsushi/YouTubeSyncServer.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, "master"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/syncpod"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, ".env"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :rbenv_ruby, "2.4.2"
set :rbenv_path, "/usr/local/rbenv"

set :log_level, :debug

set :env_file, ".env"

set :slack_url, ENV["SLACK_URL"]

namespace :deploy do
  desc "Restart application"
  task :restart do
    invoke "unicorn:restart"
  end

  desc "Create database"
  task :db_create do
    on roles(:db) do |_host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, "db:create"
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end

  task :cleanup do
    on roles(:app) do
      execute <<-COMMAND
        curl -X POST --data-urlencode \
          \"payload={ \
            \\\"channel\\\": \\\"#syncpod-server\\\", \
            \\\"username\\\": \\\"deploy\\\", \
            \\\"text\\\": \\\"#{fetch(:rails_env)}環境へ#{fetch(:branch)}をデプロイした.\\\", \
            \\\"icon_emoji\\\": \\\":aho:\\\"\
          }\" \
        #{fetch(:slack_url)}
      COMMAND
    end
  end
end
