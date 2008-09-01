set :application, "learningrails"

set :deploy_to, "/var/www/apps/#{application}"

role :app, "sampleapp.learningrails.com"
role :web, "sampleapp.learningrails.com"
role :db,  "sampleapp.learningrails.com", :primary => true

default_run_options[:pty] = true
set :repository,  "git://github.com/mzslater/learning-rails-sample-app.git"
set :scm, "git"
set :user, "deploy"
set :branch, "master"
set :deploy_via, :remote_cache

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
  desc "Start Application -- not needed for Passenger"
  task :start, :roles => :app do
    # nothing -- need to override default cap start task when using Passenger
  end
end
