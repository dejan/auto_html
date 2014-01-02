AutoHtml.add_filter(:hashtag).with(:source => :twitter) do |text, options|
  if options[:source] == :twitter
    text.gsub(/#([^ ]+)/, '<a href="http://twitter.com/search?q=%23\1&f=realtime" class="hashtag" target="_blank">#\1</a>')
  elsif options[:source] == :facebook
    text.gsub(/#([^ ]+)/, '<a href="https://www.facebook.com/hashtag/\1" class="hashtag" target="_blank">#\1</a>')
  end
end
