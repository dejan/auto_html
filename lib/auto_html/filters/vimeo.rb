AutoHtml.add_filter(:vimeo).with(:width => 440, :height => 248, :show_title => false, :fullscreen => true, :show_byline => false, :show_portrait => false) do |text, options|
  text.gsub(/http:\/\/(www.)?vimeo\.com\/([A-Za-z0-9._%-]*)((\?|#)\S+)?/) do
    vimeo_id = $2
    
    width  = options[:width]
    height = options[:height]
    
    allowfullscreen = options[:fullscreen]
    fullscreen      = options[:fullscreen]    ? 1 : 0 
    show_title      = options[:show_title]    ? 1 : 0
    show_byline     = options[:show_byline]   ? 1 : 0
    show_portrait   = options[:show_portrait] ? 1 : 0
    %{<object width="#{width}" height="#{height}"><param name="allowfullscreen" value="#{allowfullscreen}" /><param name="allowscriptaccess" value="always" /><param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=#{vimeo_id}&amp;server=vimeo.com&amp;show_title=#{show_title}&amp;show_byline=#{show_byline}&amp;show_portrait=#{show_portrait}&amp;color=00adef&amp;fullscreen=#{fullscreen}" /><embed src="http://vimeo.com/moogaloop.swf?clip_id=#{vimeo_id}&amp;server=vimeo.com&amp;show_title=#{show_title}&amp;show_byline=#{show_byline}&amp;show_portrait=#{show_portrait}&amp;color=00adef&amp;fullscreen=#{fullscreen}" type="application/x-shockwave-flash" allowfullscreen="#{allowfullscreen}" allowscriptaccess="always" width="#{options[:width]}" height="#{options[:height]}"></embed></object>}    
  end
end