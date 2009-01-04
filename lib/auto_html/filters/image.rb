module AutoHtml
  module Filters
    # transforms url to HTML img tag with URL as value of src attribute
    def auto_html_transform_image(url)
      image = auto_html_match_image(url)
      image && %|<img src="#{image}" alt=""/>|
    end

    # http://stackoverflow.com/questions/169625/regex-to-check-if-valid-url-that-ends-in-jpg-png-or-gif
    def auto_html_match_image(url)
      url[/https?:\/\/(?:[a-z\-]+\.)+[a-z]{2,6}(?:\/[^\/#?]+)+\.(?:jpg|gif|png)/]
    end
  end
end