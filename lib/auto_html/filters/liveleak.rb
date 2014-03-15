AutoHtml.add_filter(:liveleak).with(:width => 420, :height => 315, :frameborder => 0, :wmode => nil, :autoplay => false, :hide_related => false) do |text, options|
  regex = %r{http://www\.liveleak\.com/(?:ll_embed|view)\?.=(\w+)}
  text.gsub(regex) do
    liveleak_id = $1
    width = options[:width]
    height = options[:height]
    frameborder = options[:frameborder]
    wmode = options[:wmode]
    autoplay = options[:autoplay]
    hide_related = options[:hide_related]
    src = "http://www.liveleak.com/ll_embed?f=#{liveleak_id}"
    params = []
    params << "wmode=#{wmode}" if wmode
    params << "autoplay=1" if autoplay
    params << "rel=0" if hide_related
    src += "?#{params.join '&'}" unless params.empty?
    %{<iframe width="#{width}" height="#{height}" src="#{src}" frameborder="#{frameborder}" allowfullscreen></iframe>}
  end
end
