require 'redcarpet'

class NoParagraphRenderer < ::Redcarpet::Render::XHTML
  def paragraph(text)
    text
  end    
end

AutoHtml.add_filter(:youtube_og).with({:alt => ''}) do |text, options|
	alt = options[:alt]
	r = Redcarpet::Markdown.new(NoParagraphRenderer)
  	regex = /(https?):\/\/(www.)?(youtube\.com\/watch\?v=|youtu\.be\/)([A-Za-z0-9_-]*)(\&\S+)?(\S)*/
 	text.gsub(regex) do
		p = HTTParty.get(text)
		s = p.to_s
		a = s.rindex('og:image')
		b = a+19
		img = []
		while s[b] != '"' do
			img << s[b]
			b = b + 1
		end
    	r.render("![#{alt}](#{img.join})")
    end
end