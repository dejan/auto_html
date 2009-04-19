AutoHtml.add_filter(:image) do |text|
  text.gsub(/http:\/\/.+\.(jpg|gif|png)/i) do |match|
    %|<img src="#{match}" alt=""/>|
  end
end