require 'action_view'

AutoHtml.add_filter(:link).with({}) do |text, options|
  ActionView::Base.new.auto_link(text, :html => options, :sanitize => false)
end
