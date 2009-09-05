require 'rake/testtask'

desc 'Default: run tests'
task :default => :test

desc 'Test AutoHtml'
Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/**/*_test.rb'
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "auto_html"
    s.summary = %{Automatically transforms urls (via domain) and includes the destination resource (Vimeo, YouTube movie, image, ...) in your document}
    s.email = "desimic@gmail.com"
    s.homepage = "http://github.com/dejan/auto_html"
    s.description = "Automatically transforms urls (via domain) and includes the destination resource (Vimeo, YouTube movie, image, ...) in your document"
    s.authors = ["Dejan Simic"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

