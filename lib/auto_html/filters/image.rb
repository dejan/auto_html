AutoHtml.add_filter(:image) do |text|
  text.gsub(/http:\/\/.+\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i) do |match|
    %|<img src="#{match}" alt=""/>|
  end
end