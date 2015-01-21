# encoding: UTF-8
AutoHtml.add_filter(:tape_tv).with(:width => '100%', :height => 166, :frameborder => 0) do |text, options|
  require 'uri'
  require 'net/http'
  
  text.gsub(/(https?:\/\/)?(www.)?tape\.tv\/\S*/) do |match|
    width = options[:width]
    height = options[:height]
    frameborder = options[:frameborder]
    %{<iframe width="#{width}" height="#{height}" src="#{match.to_s}" frameborder="#{frameborder}" allowfullscreen></iframe>}
  end
end
