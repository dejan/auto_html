require 'redcarpet'

class NoParagraphRenderer < ::Redcarpet::Render::XHTML
  def paragraph(text)
    text
  end    
end

AutoHtml.add_filter(:soundcloud_og).with({:alt => ''}) do |text, options|
	text.gsub(/(https?):\/\/(www.)?soundcloud\.com\//) do
	alt = options[:alt]
	r = Redcarpet::Markdown.new(NoParagraphRenderer)

  	regex = /(https?):\/\/(www.)?(youtube\.com\/watch\?v=|youtu\.be\/)([A-Za-z0-9_-]*)(\&\S+)?(\S)*/
 	text.gsub(regex) do
		p = HTTParty.get(text)
		s = p.to_s
		a = s.rindex('og:image')
		b = a-13
		img = []
		while s[b] != '"' do
			img << s[b]
			b = b - 1
		end
    	r.render("![#{alt}](#{img.reverse.join})")
    end
end