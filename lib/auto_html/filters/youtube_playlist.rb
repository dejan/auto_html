AutoHtml.add_filter(:youtube_playlist).with(width: 420, height: 315, wmode: nil, frameborder: 0, autoplay: false, hide_related: false) do |text, options|
  regex = /(https?:\/\/)?(www.)?(youtube\.com\/playlist\?(?:p|list)=)([A-Za-z0-9_-]*)(\&\S+)?(\?\S+)?/
  text.gsub(regex) do
    youtube_id = $4
    width = options[:width]
    height = options[:height]
    frameborder = options[:frameborder]
    wmode = options[:wmode]
    autoplay = options[:autoplay]
    hide_related = options[:hide_related]
    src = "//www.youtube.com/embed/videoseries"

    params = []
    params << "list=#{youtube_id}"
    params << "wmode=#{wmode}" if wmode
    params << "autoplay=1" if autoplay
    params << "rel=0" if hide_related

    src += "?#{params.join '&'}" unless params.empty?
    %{<div class="video youtube"><iframe width="#{width}" height="#{height}" src="#{src}" frameborder="#{frameborder}" allowfullscreen></iframe></div>}
  end
end
