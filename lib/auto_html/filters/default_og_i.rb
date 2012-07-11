require 'redcarpet'

class NoParagraphRenderer < ::Redcarpet::Render::XHTML
  def paragraph(text)
    text
  end    
end

AutoHtml.add_filter(:default_og_i).with({:alt => ''}) do |text, options|
	alt = options[:alt]
	r = Redcarpet::Markdown.new(NoParagraphRenderer)

 	#regex = /(https?):\/\/(www.)?be(hance)?\.net\/gallery\/([A-Za-z0-9_-]*)\/([0-9])*/
 	#text.gsub(regex) do
 	text do

#/(https?):\/\/(www.)?be(hance)?\.net\/gallery\/([A-Za-z0-9_-]*)\/([0-9])*/
#add brackets () tip: \S ???

		p = HTTParty.get(text)
		s = p.to_s
		a = s.rindex('og:image')
		if !a.nil?
			b = a+19
			img = []
			while s[b] != '"' do
				img << s[b]
				b = b + 1
			end
	    	r.render("![#{alt}](#{img.join})")
	    else
	    	text
	    end
    end
end