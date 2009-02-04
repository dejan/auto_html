require 'auto_html'
require 'auto_html_for'

ActiveRecord::Base.send :include, AutoHtmlFor
