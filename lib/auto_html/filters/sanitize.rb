AutoHtml.add_filter(:sanitize).with({}) do |text, options|
  require 'action_controller'
  require 'cgi'
  if Rails::VERSION::MAJOR == 4 and Rails::VERSION::MINOR == 2
    Rails::Html::WhiteListSanitizer.new.sanitize(text, options)
  else
    HTML::WhiteListSanitizer.new.sanitize(text, options)
  end
end
