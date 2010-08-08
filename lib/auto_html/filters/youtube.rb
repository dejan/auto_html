AutoHtml.add_filter(:youtube).with(:width => 390, :height => 250, :frameborder => 0) do |text, options|
  regex = /http:\/\/(www.)?youtube\.com\/watch\?v=([A-Za-z0-9._%-]*)(\&\S+)?/
  text.gsub(regex) do
    youtube_id = $2
    width = options[:width]
    height = options[:height]
    frameborder = options[:frameborder]
    %{<iframe class="youtube-player" type="text/html" width="#{width}" height="#{height}" src="http://www.youtube.com/embed/#{youtube_id}" frameborder="#{frameborder}">
</iframe>}
  end
end

