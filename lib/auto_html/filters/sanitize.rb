AutoHtml.add_filter(:sanitize).with({}) do |text, options|
  require 'action_controller'
  require 'cgi'
  HTML::WhiteListSanitizer.new.sanitize(text, options)
end
