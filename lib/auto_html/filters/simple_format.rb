require 'action_view'

AutoHtml.add_filter(:simple_format) do |text|
  ActionView::Base.new.simple_format(text)
end
