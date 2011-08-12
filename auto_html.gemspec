Gem::Specification.new do |gem|
  gem.name = 'auto_html'
  gem.version = '1.4.2'
  gem.date = Date.today.to_s

  gem.summary = "Transform URIs to appropriate markup"
  gem.description = "Automatically transforms URIs (via domain) and includes the destination resource (Vimeo, YouTube movie, image, ...) in your document"
  
  gem.authors  = ['Dejan Simic']
  gem.email    = 'desimic@gmail.com'
  gem.homepage = 'http://github.com/dejan/auto_html'

  gem.add_dependency('rinku')
  gem.add_dependency('tag_helper')
  gem.add_dependency('RedCloth')
  gem.add_dependency('redcarpet')

  # ensure the gem is built out of versioned files
  gem.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*',
                  'README*', 'LICENSE'] & `git ls-files -z`.split("\0")
end

