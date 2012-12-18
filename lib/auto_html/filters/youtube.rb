AutoHtml.add_filter(:youtube).with(:width => 420, :height => 315, :frameborder => 0, :wmode => nil, :hd => 1, :rel => 0, :rel => 0, :fs => 1, :controls => 1, :showinfo => 1) do |text, options|
  regex = /https?:\/\/(www.)?(youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/watch\?feature=player_embedded&v=)([A-Za-z0-9_-]*)(\&\S+)?(\S)*/
  text.gsub(regex) do
    youtube_id = $3
    width = options[:width]
    height = options[:height]
    frameborder = options[:frameborder]
    wmode = options[:wmode]
    hd = options[:hd]
    rel = options[:rel]
    fs = options[:fs]
    controls = options[:controls]
    showinfo = options[:schowinfo]
    src = "//www.youtube.com/embed/#{youtube_id}?rel=#{rel}&fs=#{fs}&HD=#{hd}&showinfo=#{showinfo}&controls=#{controls}"
    src += "?wmode=#{wmode}" if wmode
    %{<iframe title="YouTube video player" width="#{width}" height="#{height}" src="#{src}" frameborder="#{frameborder}" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>}
  end
end
