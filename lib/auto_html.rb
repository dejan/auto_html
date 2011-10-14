%w(base filter builder auto_html_for).each do |f|
  require File.expand_path("../auto_html/#{f}", __FILE__)
end

Dir["#{File.dirname(__FILE__) + '/auto_html/filters'}/**/*"].each do |filter|
  require "#{filter}"
end

# if rails
require 'auto_html/railtie' if defined?(Rails::Railtie)
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.send :include, AutoHtmlFor

  module ActionView::Helpers::TextHelper
    include AutoHtml
  end
end