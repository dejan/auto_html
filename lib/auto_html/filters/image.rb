module AutoHtml
  module Filters
    # transforms url to HTML img tag with URL as value of src attribute
    def auto_html_transform_image(url)
      image = auto_html_match_image(url)
      image && %|<img src="#{image}" alt=""/>|
    end
    
    def auto_html_match_image(url)
      url[/http:\/\/.+(jpg|gif|png)/]
    end
  end
end