module AutoHtml
  # Instagram filter
  class Instagram < Filter
    def call(text)
      text << '/' unless text.end_with?('/')
      text.gsub(regexp) do
        tag(
          :iframe,
          src: "#{text}embed",
          height: height,
          width: width,
          frameborder: 0,
          scrolling: 'no') { '' }
      end
    end

    private

    def width
      options[:width] || 616
    end

    def height
      options[:height] || 714
    end

    def regexp
      %r{https?:\/\/(www.)?instagr(am\.com|\.am)/p/.+}
    end
  end
end
