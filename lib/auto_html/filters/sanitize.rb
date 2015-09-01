AutoHtml.add_filter(:sanitize).with({}) do |text, options|
  require 'action_controller'
  require 'cgi'

  sanitizer_class = if defined?(HTML::WhiteListSanitizer)
      HTML::WhiteListSanitizer
    else
      Rails::Html::WhiteListSanitizer
    end

  sanitizer_class.new.sanitize(text, options)
end
