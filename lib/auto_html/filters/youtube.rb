AutoHtml.add_filter(:youtube).with(:width => 390, :height => 250, :frameborder => 0, :wmode => "window") do |text, options|
  regex = /http:\/\/(www.)?youtube\.com\/watch\?v=([A-Za-z0-9._%-]*)(\&\S+)?|http:\/\/(www.)?youtu\.be\/([A-Za-z0-9._%-]*)?/
  text.gsub(regex) do
    youtube_id = $2 || $5
    width = options[:width]
    height = options[:height]
    frameborder = options[:frameborder]
		wmode = options[:wmode]
    %{<iframe class="youtube-player" type="text/html" width="#{width}" height="#{height}" src="http://www.youtube.com/embed/#{youtube_id}?wmode=#{wmode}" frameborder="#{frameborder}">
</iframe>}
  end
end

