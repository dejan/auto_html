require 'redcloth'

AutoHtml.add_filter(:redcloth).with({}) do |text, options|
  result = RedCloth.new(text).to_html
  if options and options[:target] and options[:target].to_sym == :_blank
    result.gsub!(/<a/,'<a target="_blank"')
  end
  result
end