AutoHtml.add_filter(:twitter_hashtag) do |text, options|
  text.gsub(/#([^ ]+)/, '<a href="http://twitter.com/search?q=%23\1&f=realtime" class="hashtag" target="_blank">#\1</a>')
end
