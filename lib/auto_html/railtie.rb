require 'auto_html'
require 'rails'

module AutoHtml
  class Railtie < Rails::Railtie
    rake_tasks do
      require "auto_html/rake_tasks"
    end
  end
end