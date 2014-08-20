AutoHtml.add_filter(:rutube).with(width: 640, height: 480, frameborder: 0) do |text, options|
  regex = %r{(https?://)?(www.)?rutube\.ru/(play|video)/(embed/)?([A-Za-z0-9]*)(/.*)?}
  text.gsub(regex) do
    rutube_id = $5
    width = options[:width]
    height = options[:height]
    frameborder = options[:frameborder]
    src = "//rutube.ru/video/embed/#{rutube_id}"
    %{<iframe src="#{src}" width="#{width}" height="#{height}" frameborder="#{frameborder}" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>}
  end
end
