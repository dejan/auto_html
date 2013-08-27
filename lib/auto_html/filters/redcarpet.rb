require 'redcarpet'
AutoHtml.add_filter(:redcarpet).with(:renderer => Redcarpet::Render::HTML, :markdown_options => {}) do |text, options|
  Redcarpet::Markdown.new(options[:renderer], options[:markdown_options]).render(text)
end
