module AutoHtml
  class Filter

    def initialize(block)
      @block = block
      @options = {}
    end

    def self.create(name, &block)
      returning Filter.new(block) do |filter|
        AutoHtml.filters.merge!(name => filter)
      end
    end

    def with(options, &block)
      @options = options
      @block = block
    end

    def apply(text)
      if @options.empty?
        @block.call(text.dup)
      else
        @block.call(text.dup, @options)
      end
    end

    #
    # Tweaking options. Example:
    # 
    #   AutoHtml.filters[:youtube].tweak(:width => 300, :height => 200)
    # 
    def tweak(tweaked_options)
      @options.merge!(tweaked_options)
    end

  end
end