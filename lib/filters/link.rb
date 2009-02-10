require 'action_view'
include ActionView::Helpers::TagHelper

AutoHtml::Builder.add_filter(:link).
  with(
    :html_options => {},
    :auto_link_re => %r{
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
                 }x) do |text, options|

  auto_link_re = options[:auto_link_re]
  html_options = options[:html_options]
  extra_options = tag_options(html_options.stringify_keys) || ""
  text.gsub(options[:auto_link_re]) do
    all, a, b, c, d = $&, $1, $2, $3, $4
    if a =~ /<a\s/i # don't replace URL's that are already linked
      all
    else
      text = b + c
      text = yield(text) if block_given?
      %(#{a}<a href="#{b=="www."?"http://www.":b}#{c}"#{extra_options}>#{text}</a>#{d})
    end
  end
end
