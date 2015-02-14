module AutoHtml
  # Google Maps filter
  class GoogleMaps < Filter
    def call(text)
      regex = %r{(https?)://maps\.google\.([a-z\.]+)/maps\?(.*)}
      text.gsub(regex) do
        country = Regexp.last_match(2)
        path = "//maps.google.#{country}/maps"
        query = Regexp.last_match(3)
        link = link_tag(path, query)
        iframe_tag(path, query) << tag(:br) << tag(:small) { link }
      end
    end

    private

    def iframe_tag(path, map_query)
      params = ['f=q', 'source=s_q', map_query, 'output=embed'] + map_options
      tag(
        :iframe,
        width: width,
        height: height,
        frameborder: 0,
        scrolling: 'no',
        marginheight: 0,
        marginwidth: 0,
        src: path + '?' + params.join('&amp;')) { '' }
    end

    def link_tag(path, map_query)
      params = ['f=q', 'source=embed', map_query]
      tag(
        :a,
        href: path + '?' + params.join('&amp;'),
        style: link_style) do
          link_text
        end
    end

    def width
      @width ||= options[:width] || 420
    end

    def height
      @height ||= options[:height] || 315
    end

    def type
      @type ||= options[:type] || :normal
    end

    def zoom
      @zoom ||= options[:zoom] || 18
    end

    def link_text
      @link_text ||= options[:link_text] || 'View Larger Map'
    end

    def link_style
      @link_style ||= options[:style] || 'color:#000;text-align:left'
    end

    def show_info?
      @show_info ||= options[:show_info] || false
    end

    def map_options
      map_options = []
      map_options << 'iwloc=near' if show_info?
      map_options << map_types[type]
      map_options << "z=#{zoom}"
    end

    def map_types
      @map_types ||= {
        normal: 't=m',
        satellite: 't=k',
        terrain: 't=p',
        hibrid: 't=h'
      }
    end
  end
end
