# Capistrano task for AutoHtml.
# Just add:

# require 'auto_html/capistrano'
# in your Capistrano deploy.rb, you will have AutoHtml rake task in Capistrano

Capistrano::Configuration.instance(:must_exist).load do
  namespace :auto_html do
    desc "Rebuild auto_html columns"
    task :rebuild do
      run "cd #{current_path} && bundle exec rake auto_html:rebuild RAILS_ENV=#{rails_env}"
    end
  end
end