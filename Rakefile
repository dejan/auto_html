require 'rake/testtask'

desc 'Default: run tests'
task :default => :test

desc 'Test AutoHtml'
Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/**/*_test.rb'
end

desc 'Test with recent versions of Rails'
task :test_with_recent do
  versions = ['2.3.8', '3.0.3']
  versions.each do |v|
    puts "\n###### TESTING WITH RAILS #{v}"
    ENV['RAILS_VERSION'] = v
    Rake::Task['test'].execute
  end
end

desc 'Test with versions of Rails available on the system'
task :test_with_installed do
  versions = `gem list rails | grep rails`.gsub("rails (", "").chop.split(', ')
  exclude = []
  (versions-exclude).each do |v|
    puts "\n###### TESTING WITH RAILS #{v}"
    ENV['RAILS_VERSION'] = v
    Rake::Task['test'].execute
  end
end
