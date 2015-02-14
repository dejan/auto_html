require 'cgi'

module AutoHtml
  # HTML escape filter
  class HtmlEscape < Filter
    def call(text)
      CGI.escapeHTML(text)
    end
  end
end
