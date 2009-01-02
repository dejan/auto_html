module AutoHtml
  module Filters
    module Image

      # transforms url to HTML img tag with URL as value of src attribute
      def auto_image(url)
        image = url[image_regexp]
        image && %|<img src="#{image}" alt=""/>|
      end

    protected

      # http://stackoverflow.com/questions/169625/regex-to-check-if-valid-url-that-ends-in-jpg-png-or-gif
      def image_regexp
        /https?:\/\/(?:[a-z\-]+\.)+[a-z]{2,6}(?:\/[^\/#?]+)+\.(?:jpg|gif|png)/
      end
    end
  end
end