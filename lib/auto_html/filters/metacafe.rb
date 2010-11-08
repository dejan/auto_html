AutoHtml.add_filter(:metacafe).with(:width => 440, :height => 272, :show_stats => false, :autoplay => false) do |text, options|
  text.gsub(/http:\/\/www\.metacafe\.com\/watch\/([A-Za-z0-9._%-]*)\/([A-Za-z0-9._%-]*)(\/)?/) do
    metacafe_id = $1
    metacafe_slug = $2
    width  = options[:width]
    height = options[:height]
    show_stats      = options[:show_stats] ? "showStats=yes" : "showStats=no"
    autoplay        = options[:autoplay] ? "autoPlay=yes" : "autoPlay=no"
    flash_vars = [show_stats, autoplay].join("|")

    %{<div style="background:#000000;width:#{width}px;height:#{height}px"><embed flashVars="playerVars=#{flash_vars}" src="http://www.metacafe.com/fplayer/#{metacafe_id}/#{metacafe_slug}.swf" width="#{width}" height="#{height}" wmode="transparent" allowFullScreen="true" allowScriptAccess="always" name="Metacafe_#{metacafe_id}" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"></embed></div>}
  end
end
