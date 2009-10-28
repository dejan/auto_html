AutoHtml.add_filter(:vimeo).with(:width => 440, :height => 248, :title => false, :byline => false, :portrait => false, :fullscreen => true) do |text, options|
  text.gsub(/http:\/\/(www.)?vimeo\.com\/([A-Za-z0-9._%-]*)((\?|#)\S+)?/) do
    vimeo_id = $2
    %{
      <object width="#{options[:width]}" height="#{options[:height]}">
        <param name="allowfullscreen" value="#{options[:fullscreen].blank? ? false : true}" />
        <param name="allowscriptaccess" value="always" />
        <param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=#{vimeo_id}&amp;server=vimeo.com&amp;show_title=#{options[:title].blank? ? 0 : 1}&amp;show_byline=#{options[:byline].blank? ? 0 : 1}&amp;show_portrait=#{options[:portrait].blank? ? 0 : 1}&amp;color=00adef&amp;fullscreen=#{options[:fullscreen].blank? ? 0 : 1}" />
        <embed src="http://vimeo.com/moogaloop.swf?clip_id=#{vimeo_id}&amp;server=vimeo.com&amp;show_title=#{options[:title].blank? ? 0 : 1}&amp;show_byline=#{options[:byline].blank? ? 0 : 1}&amp;show_portrait=#{options[:portrait].blank? ? 0 : 1}&amp;color=00adef&amp;fullscreen=#{options[:fullscreen].blank? ? 0 : 1}" type="application/x-shockwave-flash" allowfullscreen="#{options[:fullscreen].blank? ? false : true}" allowscriptaccess="always" width="#{options[:width]}" height="#{options[:height]}"></embed>
      </object>
    }    
  end
end