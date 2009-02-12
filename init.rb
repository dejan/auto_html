require 'auto_html'

ActiveRecord::Base.send :include, AutoHtmlFor

# Register built-in filters
#
Dir["#{File.dirname(__FILE__) + '/auto_html/filters'}/**/*"].each do |filter|
  require "#{filter}"
end
