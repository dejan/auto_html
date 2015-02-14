require 'tag_helper'

module AutoHtml
  # Image filter
  class Image < Filter
    def call(text)
      text.gsub(regexp) do |match|
        tag(:img, src: proxy + match, alt: alt)
      end
    end

    private

    def regexp
      %r{(?<!src=")https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?}i
    end

    def proxy
      options[:proxy] || ''
    end

    def alt
      options[:alt] || ''
    end
  end
end
