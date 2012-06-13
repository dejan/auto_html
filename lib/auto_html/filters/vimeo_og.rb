AutoHtml.add_filter(:vimeo_og).with(:width => 440, :height => 248, :show_title => false, :show_byline => false, :show_portrait => false) do |text, options|
    text.gsub(/(https?):\/\/(www.)?vimeo\.com\/([A-Za-z0-9._%-]*)((\?|#)\S+)?/) do
		p = HTTParty.get(text)
		s = p.to_s
		a = s.rindex('og:image')
		b = a+19
		img = []
		while s[b] != '"' do
			img << s[b]
			b = b + 1
		end
		img.join
    end
end