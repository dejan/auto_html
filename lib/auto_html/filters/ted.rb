# TED talks (http://www.ted.com)
AutoHtml.add_filter(:ted).with(:width => 640, :height => 360, :scrolling => "no", :frameborder => 0, :allow_full_screen => false) do |text, options|
  text.gsub(/https?:\/\/(www.|embed.)?ted\.com\/talks\/([A-Za-z0-9._%-]*)\.html((\?|#)\S+)?/) do
    ted_page = $2
    width = options[:width]
    height = options[:height]
    scrolling = options[:scrolling]
    frameborder = options[:frameborder]
    allow_full_screen = options[:allow_full_screen]

    %{<iframe width="#{width}" height="#{height}" frameborder="#{frameborder}" scrolling="#{scrolling}" src="http://embed.ted.com/talks/#{ted_page}.html"#{allow_full_screen ? ' webkitAllowFullScreen mozallowfullscreen allowFullScreen' : ''}></iframe>}
  end
end