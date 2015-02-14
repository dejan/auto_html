module AutoHtml
  # YouTube filter
  class Youtube < Filter
    def call(text)
      text.gsub(regexp) do
        youtube_id = Regexp.last_match(4)
        tag(:div, class: 'video youtube') do
          tag(:iframe, iframe_attributes(youtube_id)) { '' }
        end
      end
    end

    private

    def regexp
      %r{
        (https?://)?
        (www.)?
        (
          youtube\.com/watch\?v=|
          youtu\.be/|
          youtube\.com/watch\?feature=player_embedded&v=
        )
        ([A-Za-z0-9_-]*)(\&\S+)?(\?\S+)?
      }x
    end

    def iframe_attributes(youtube_id)
      src = "//www.youtube.com/embed/#{youtube_id}"
      src += "?#{params.join '&'}" unless params.empty?
      {
        width: width,
        height: height,
        src: src,
        frameborder: frameborder,
        allowfullscreen: 'yes'
      }
    end

    def width
      options[:width] || 420
    end

    def height
      options[:height] || 315
    end

    def wmode
      options[:wmode]
    end

    def frameborder
      options[:frameborder] || 0
    end

    def autoplay
      options[:autoplay] || false
    end

    def hide_related
      options[:hide_related] || false
    end

    def params
      [].tap do |p|
        p << "wmode=#{wmode}" if wmode
        p << 'autoplay=1' if autoplay
        p << 'rel=0' if hide_related
      end
    end
  end
end
