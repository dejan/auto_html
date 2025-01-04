# frozen_string_literal: true

Gem::Specification.new do |gem|
  gem.name = 'auto_html'
  gem.version = '2.1.1'

  gem.summary = 'Plain text to HTML conversion'
  gem.description = 'Collection of filters for transforming text into HTML code'

  gem.author   = 'Dejan Simic'
  gem.email    = 'desimic@gmail.com'
  gem.homepage = 'https://github.com/dejan/auto_html'
  gem.license  = 'MIT'

  gem.add_dependency 'gemoji', '~> 4.0.0.rc2'
  gem.add_dependency 'redcarpet', '~> 3.5'
  gem.add_dependency 'rexml', '~> 3.3.9'
  gem.add_dependency 'rinku', '~> 2.0'

  gem.required_ruby_version = '>= 2.5.0'

  gem.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*',
                  'README*', 'LICENSE'] & `git ls-files -z`.split("\0")
  gem.metadata = {
    'rubygems_mfa_required' => 'true'
  }
end
