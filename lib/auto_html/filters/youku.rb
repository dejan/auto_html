AutoHtml.add_filter(:youku).with(:width => 420, :height => 315, :frameborder => 0, :wmode => nil) do |text, options|
  regex = /https?:\/\/(www.)?(v\.youku\.com\/v_show\/id_|player\.youku\.com\/player\.php\/sid\/)(\w+)(\.html|v\.swf)/
  text.gsub(regex) do
    youku_id = $3
    width = options[:width]
    height = options[:height]
    frameborder = options[:frameborder]
		wmode = options[:wmode]
		src = "//player.youku.com/embed/#{youku_id}"
		src += "?wmode=#{wmode}" if wmode
    %{<iframe video-side="youku" video-id="#{youku_id}" width="#{width}" height="#{height}" src="#{src}" frameborder="#{frameborder}" allowfullscreen></iframe>}
  end
end
