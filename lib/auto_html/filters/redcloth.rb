require 'redcloth'
AutoHtml.add_filter(:redcloth) do |text|
  RedCloth.new(text).to_html
end