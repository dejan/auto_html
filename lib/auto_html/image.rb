require 'tag_helper'

module AutoHtml
  # Image filter
  class Image
    def initialize(proxy: nil, alt: nil)
      @proxy = proxy || ''
      @alt = alt
    end

    def call(text)
      text.gsub(image_pattern) do |match|
        TagHelper.tag(:img, src: @proxy + match, alt: @alt)
      end
    end

    private

    def image_pattern
      %r{(?<!src=")https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?}i
    end
  end
end
