AutoHtml.add_filter(:soundcloud).with(:width => 100, :height => 248) do |text, options|
	text.gsub(/(https?):\/\/(www.)?soundcloud\.com\//) do
		p = HTTParty.get(text)
		s = p.to_s
		a = s.rindex('%2Ftracks%2F')
		b = s.rindex('&amp;color')
		track_num = s[(a+12)..(b-1)]
		width  = options[:width]
    	height = options[:height]

    	%{<iframe width="#{width}" height="#{height}" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F#{track_num}&show_artwork=true"></iframe>}
    end
end