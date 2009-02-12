AutoHtml.add_filter(:link).with(:html_options => {}) do |text, options|
  require 'action_view'
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TextHelper

  html_options = options[:html_options]
  extra_options = tag_options(html_options.stringify_keys) || ""
  text.gsub(AUTO_LINK_RE) do
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
