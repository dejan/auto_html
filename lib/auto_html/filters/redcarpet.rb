require 'redcarpet'

# Usage : 
# auto_html(my_text) do
#   redcarpet renderer: MyMarkdownRenderer , markdown_options: {autolink: true}
# end
AutoHtml.add_filter(:redcarpet).with(:renderer => Redcarpet::Render::HTML, :markdown_options => {}) do |text, options|
  Redcarpet::Markdown.new(options[:renderer], options[:markdown_options]).render(text)
end
