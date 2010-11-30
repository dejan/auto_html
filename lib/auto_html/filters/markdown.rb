require 'bluecloth'

AutoHtml.add_filter(:markdown).with({}) do |text, options|
  BlueCloth.new(text).to_html
end
