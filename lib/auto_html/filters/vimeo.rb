AutoHtml.add_filter(:vimeo).with(width: 440, height: 248, show_title: false, show_byline: false, show_portrait: false, frameborder: 0) do |text, options|
  regex = %r{(https?://)?(www.|player.)?vimeo\.com/(video/)?([A-Za-z0-9._%-]*)((\?|#)\S+)?(/.+)?}
  text.gsub(regex) do
    vimeo_id = $4
    width  = options[:width]
    height = options[:height]
    show_title      = 'title=0'    unless options[:show_title]
    show_byline     = 'byline=0'   unless options[:show_byline]
    show_portrait   = 'portrait=0' unless options[:show_portrait]
    frameborder     = options[:frameborder] || 0
    query_string_variables = [show_title, show_byline, show_portrait].compact.join('&')
    query_string    = '?' + query_string_variables unless query_string_variables.empty?

    %{<iframe src="//player.vimeo.com/video/#{vimeo_id}#{query_string}" width="#{width}" height="#{height}" frameborder="#{frameborder}" allowfullscreen></iframe>}
  end
end
