# frozen_string_literal: true

Gem::Specification.new do |gem|
  gem.name = 'auto_html'
  gem.version = '2.1.0'

  gem.summary = 'Plain text to HTML conversion'
  gem.description = 'Collection of filters for transforming text into HTML code'

  gem.author   = 'Dejan Simic'
  gem.email    = 'desimic@gmail.com'
  gem.homepage = 'https://github.com/dejan/auto_html'
  gem.license  = 'MIT'

  gem.add_dependency 'gemoji', '~> 4.0.0.rc2'
  gem.add_dependency 'redcarpet', '~> 3.5'
  gem.add_dependency 'rinku', '~> 2.0'
  gem.add_dependency 'rexml', '~> 3.2.5'

  gem.required_ruby_version = '>= 2.5.0'

  gem.add_development_dependency 'rake', '~> 13.0.6'
  gem.add_development_dependency 'rspec', '~> 3.3'
  gem.add_development_dependency 'rspec_junit_formatter', '~> 0.2'
  gem.add_development_dependency 'rubocop', '~> 1.23'

  gem.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*',
                  'README*', 'LICENSE'] & `git ls-files -z`.split("\0")
  gem.metadata = {
    'rubygems_mfa_required' => 'true'
  }
end
