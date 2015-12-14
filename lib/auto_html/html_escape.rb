require 'cgi'

module AutoHtml
  # HTML escape filter
  class HtmlEscape
    def call(text)
      CGI.escapeHTML(text)
    end
  end
end
