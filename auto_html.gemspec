Gem::Specification.new do |gem|
  gem.name = 'auto_html'
  gem.version = '1.5.1.1'
  gem.date = "2014-03-16"

  gem.summary = "Transform URIs to appropriate markup"
  gem.description = "Automatically transforms URIs (via domain) and includes the destination resource (Vimeo, YouTube movie, image, ...) in your document"
  
  gem.authors  = ['Dejan Simic']
  gem.email    = 'desimic@gmail.com'
  gem.homepage = 'http://github.com/dejan/auto_html'

  gem.add_dependency('rinku', '~> 1.5.0')
  gem.add_dependency('redcarpet', '~> 2.0.0')

  # ensure the gem is built out of versioned files
  gem.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*',
                  'README*', 'LICENSE'] & `git ls-files -z`.split("\0")
end

