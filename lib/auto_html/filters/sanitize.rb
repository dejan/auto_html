require 'action_controller'
require 'cgi'

AutoHtml.add_filter(:sanitize).with({}) do |text, options|
  HTML::WhiteListSanitizer.new.sanitize(text, options)
end