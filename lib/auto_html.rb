%w(base filter builder auto_html_for).each do |f|
  require File.dirname(__FILE__) + "/auto_html/#{f}"
end

# Register built-in filters
#
Dir["#{File.dirname(__FILE__) + '/auto_html/filters'}/**/*"].each do |filter|
  require "#{filter}"
end
