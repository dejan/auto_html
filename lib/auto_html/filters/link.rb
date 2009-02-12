# major portion of code in here is copied/adjusted from 
# ActionView::Helpers::TagHelper and
# ActionView::Helpers::TextHelper
#
AutoHtml.add_filter(:link).with({}) do |text, options|
  
  def tag_options(options)
    unless options.blank?
      attrs = []
      attrs = options.map { |key, value| %(#{key}="#{value}") }
      " #{attrs.sort * ' '}" unless attrs.empty?
    end
  end

  def auto_link_re
    %r{
      (                          # leading text
        <\w+.*?>|                # leading HTML tag, or
        [^=!:'"/]|               # leading punctuation, or
        ^                        # beginning of line
      )
      (
        (?:https?://)|           # protocol spec, or
        (?:www\.)                # www.*
      )
      (
        [-\w]+                   # subdomain or domain
        (?:\.[-\w]+)*            # remaining subdomains or domain
        (?::\d+)?                # port
        (?:/(?:[~\w\+@%=\(\)-]|(?:[,.;:'][^\s$]))*)* # path
        (?:\?[\w\+@%&=.;:-]+)?     # query string
        (?:\#[\w\-]*)?           # trailing anchor
      )
      ([[:punct:]]|<|$|)       # trailing text
     }x
  end

  extra_options = tag_options(options.stringify_keys) || ""
  text.gsub(auto_link_re) do
    all, a, b, c, d = $&, $1, $2, $3, $4
    if a =~ /<a\s/i # don't replace URL's that are already linked
      all
    else
      text = b + c
      %(#{a}<a href="#{b=="www."?"http://www.":b}#{c}"#{extra_options}>#{text}</a>#{d})
    end
  end
end
