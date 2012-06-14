require 'redcarpet'

class NoParagraphRenderer < ::Redcarpet::Render::XHTML
  def paragraph(text)
    text
  end    
end

AutoHtml.add_filter(:vimeo_og).with({:alt => ''}) do |text, options|
	alt = options[:alt]
	r = Redcarpet::Markdown.new(NoParagraphRenderer)
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
		text.gsub(/https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i) do |match|
    		r.render("![#{alt}](#{match})")
    	end
    end
end