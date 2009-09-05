require 'rake/testtask'

desc 'Default: run tests'
task :default => :test

desc 'Test AutoHtml'
Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/**/*_test.rb'
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "auto_html"
    gem.summary = %{Automatically transforms urls (via domain) and includes the destination resource (Vimeo, YouTube movie, image, ...) in your document}
    gem.email = "desimic@gmail.com"
    gem.homepage = "http://github.com/dejan/auto_html"
    gem.description = "Automatically transforms urls (via domain) and includes the destination resource (Vimeo, YouTube movie, image, ...) in your document"
    gem.authors = ["Dejan Simic"]
    gem.files.exclude 'test.sqlite3'
    gem.has_rdoc = false
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

