# encoding: UTF-8
AutoHtml.add_filter(:google_map).with(:width => 420, :height => 315, :style => "color:#000;text-align:left", :link_text => "View Larger Map", :show_info => true, :type => :normal, :zoom => 18, :more => '') do |text, options|
  map_type = { :normal => '&amp;t=m', :satellite => '&amp;t=k', :terrain => '&amp;t=p', :hibrid => '&amp;t=h' }
  regex = /(https?):\/\/maps\.google\.([a-z\.]+)\/maps\?(.*)/
  text.gsub(regex) do
    domain_country = $2
    map_query = $3
    width = options[:width]
    height = options[:height]
    style = options[:style]
    link_text = options[:link_text]
    type = options[:type].to_sym
    map_options = (options[:show_info] ? '' : '&amp;iwloc=near')
    map_options << map_type[type] if map_type.has_key?(type)
    map_options << "&amp;z=#{options[:zoom]}"
    map_options << options[:more]
    %{<iframe width="#{width}" height="#{height}" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="//maps.google.#{domain_country}/maps?f=q&amp;source=s_q&amp;#{map_query}&amp;output=embed#{map_options}"></iframe><br /><small><a href="//maps.google.#{domain_country}/maps?f=q&amp;source=embed&amp;#{map_query}" style="#{style}">#{link_text}</a></small>}
  end
end
