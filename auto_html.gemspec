Gem::Specification.new do |gem|
  gem.name = 'auto_html'
  gem.version = '2.0.0'

  gem.summary = 'Plain text to HTML conversion'
  gem.description = 'Collection of filters for transforming text into HTML code'

  gem.author   = 'Dejan Simic'
  gem.email    = 'desimic@gmail.com'
  gem.homepage = 'https://github.com/dejan/auto_html'
  gem.license  = 'MIT'

  gem.add_dependency 'tag_helper', '~> 0.5'
  gem.add_dependency 'rinku', '~> 1.7'
  gem.add_dependency 'gemoji', '~> 2.1'
  gem.add_dependency 'redcarpet', '~> 3.3'

  gem.add_development_dependency 'rake', '~> 10.4'
  gem.add_development_dependency 'rspec', '~> 3.3'
  gem.add_development_dependency 'rspec_junit_formatter', '~> 0.2'
  gem.add_development_dependency 'rubocop', '~> 0.33'

  gem.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*',
                  'README*', 'LICENSE'] & `git ls-files -z`.split("\0")
end
