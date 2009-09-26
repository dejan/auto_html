require 'action_view'

AutoHtml.add_filter(:link).with({}) do |text, options|
  ActionView::Base.new.auto_link(text, :all, options)
end
