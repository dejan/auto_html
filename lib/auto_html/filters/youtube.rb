AutoHtml.add_filter(:youtube).with(:width => 420, :height => 315, :frameborder => 0, :wmode => nil) do |text, options|
  regex = /http:\/\/(www.)?youtube\.com\/watch\?v=([A-Za-z0-9_-]*)(\&\S+)?|http:\/\/(www.)?youtu\.be\/([A-Za-z0-9_-]*)?/
  text.gsub(regex) do
    youtube_id = $2 || $5
    width = options[:width]
    height = options[:height]
    frameborder = options[:frameborder]
		wmode = options[:wmode]
		src = "http://www.youtube.com/embed/#{youtube_id}"
		src += "wmode=#{wmode}" if wmode
    %{<iframe width="#{width}" height="#{height}" src="#{src}" frameborder="#{frameborder}" allowfullscreen></iframe>}
  end
end

