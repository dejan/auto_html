%w(base filter builder auto_html_for).each do |f|
  require File.expand_path("../auto_html/#{f}", __FILE__)
end

Dir["#{File.dirname(__FILE__) + '/auto_html/filters'}/**/*"].each do |filter|
  require "#{filter}"
end

ActiveRecord::Base.send :include, AutoHtmlFor
