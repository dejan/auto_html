AutoHtml.register_filter(:image, /http:\/\/.+(jpg|gif|png)/) do |match|
  %|<img src="#{match}" alt=""/>|
end
