AutoHtml.add_filter(:coub).with(width: 640, height: 480, frameborder: 0, allowfullscreen: true) do |text, options|
  regex = %r{(https?://)?(www.)?(coub\.com/(view|embed)/([A-Za-z0-9]*))(/.+)?}
  text.gsub(regex) do
    coub_id = $5
    width = options[:width]
    height = options[:height]
    frameborder = options[:frameborder]
    allowfullscreen = options[:allowfullscreen]
    src = "//coub.com/embed/#{coub_id}"
    %{<iframe src="#{src}?muted=false&autostart=false&originalSize=false&hideTopBar=false&noSiteButtons=false&startWithHD=false" width="#{width}" height="#{height}" frameborder="#{frameborder}" "#{'allowfullscreen' if allowfullscreen}"></iframe>}
  end
end
