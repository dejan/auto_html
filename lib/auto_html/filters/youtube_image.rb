AutoHtml.add_filter(:youtube_image).with(:width => 320, :height => 315, :style => 'medium', :target => 'blank', :border => '0') do |text, options|
  styles = { 'default' => 'default', 'high' => 'hqdefault',
             'medium' => 'mqdefault', 'normal' => 'sddefault',
             'max' => 'maxresdefault' }
  regex = /(https?:\/\/)?(www.)?(youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/watch\?feature=player_embedded&v=)([A-Za-z0-9_-]*)(\&\S+)?(\?\S+)?/
  text.gsub(regex) do
    youtube_id = $4
    video_url = "https://www.youtube.com/watch?v=#{youtube_id}"
    target = options[:target]
    width = options[:width]
    height = options[:height]
    border = options[:border]
    style = styles[options[:style]] rescue styles['default']
    src = "//img.youtube.com/vi/#{youtube_id}/#{style}.jpg"
    %{<div class="thumbnail youtube"><a href="#{video_url}" target="_#{target}"><img src="#{src}" width="#{width}" height="#{height}" border="#{border}"></a></div>}
  end
end