require 'rake/testtask'

desc 'Default: run tests'
task :default => :test

desc 'Test AutoHtml'
Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/**/*_test.rb'
end

desc 'Test with versions of Rails available on the system'
task :test_with_installed do
  versions = `gem list rails | grep rails`.gsub("rails (", "").chop.chop.split(', ')
  exclude = []
  (versions-exclude).each do |v|
    puts "\n###### TESTING WITH RAILS #{v}"
    ENV['RAILS_VERSION'] = v
    Rake::Task['test'].execute
  end
end
