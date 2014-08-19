# encoding: UTF-8
AutoHtml.add_filter(:soundcloud).with(width: '100%', height: 166, auto_play: false, theme_color: '00FF00', color: '915f33', show_comments: false, show_artwork: false) do |text, options|
  require 'uri'
  require 'net/http'
  regex = %r{(https?://)?(www.)?soundcloud\.com/\S*}
  text.gsub(regex) do |match|
    new_uri = match.to_s
    new_uri = new_uri[/^https?\:\/\/.*/] ? URI(new_uri) : URI("http://#{new_uri}")
    new_uri.normalize!
    width = options[:width]
    height = options[:height]
    auto_play = options[:auto_play]
    theme_color = options[:theme_color]
    color = options[:color]
    show_artwork = options[:show_artwork]
    show_comments = options[:show_comments]
    %{<iframe width="#{width}" height="#{height}" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=#{new_uri}&show_artwork=#{show_artwork}&show_comments=#{show_comments}&auto_play=#{auto_play}&color=#{color}&theme_color=#{theme_color}"></iframe>}
  end
end
