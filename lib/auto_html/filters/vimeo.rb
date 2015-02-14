module AutoHtml
  # Vimeo filter
  class Vimeo < Filter
    def call(text)
      text.gsub(regexp) do
        vimeo_id = Regexp.last_match(2)
        src = src_url(vimeo_id)
        tag(:iframe, { src: src }.merge(iframe_attributes)) { '' }
      end
    end

    private

    def regexp
      %r{https?://(www.)?vimeo\.com/([A-Za-z0-9._%-]*)((\?|#)\S+)?}
    end

    def src_url(vimeo_id)
      path = "//player.vimeo.com/video/#{vimeo_id}"
      src_params = params.compact.join('&')
      [path, src_params].compact.join('?')
    end

    def params
      [].tap do |x|
        x << 'title=0' unless options[:show_title]
        x << 'byline=0' unless options[:show_byline]
        x << 'portrait=0' unless options[:show_portrait]
      end
    end

    def iframe_attributes
      {}.tap do |attrs|
        attrs[:width] = width
        attrs[:height] = height
        attrs[:frameborder] = frameborder
        attrs.merge!(fullscreen_attributes) if allow_fullscreen?
      end
    end

    def allow_fullscreen?
      options[:allow_fullscreen] || false
    end

    def fullscreen_attributes
      {
        webkitallowfullscreen: 'yes',
        mozallowfullscreen: 'yes',
        allowfullscreen: 'yes'
      }
    end

    def frameborder
      options[:frameborder] || 0
    end

    def width
      options[:width] || 440
    end

    def height
      options[:height] || 248
    end
  end
end
