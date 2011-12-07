require 'redcarpet'

AutoHtml.add_filter(:redcarpet).with(:renderer => Redcarpet::Render::HTML) do |text, options|
  Redcarpet::Markdown.new(options[:renderer]).render(text)
end