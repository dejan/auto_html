module AutoHtml
  class Filter
    def initialize(block)
      @block = block
      @options = nil
    end

    def with(options, &block)
      @options = options
      @block = block
    end

    def apply(text, options = {})
      _options = @options && @options.merge(options)
      if _options
        @block.call(text.to_s.to_str.dup, _options)
      else
        @block.call(text.to_s.to_str.dup)
      end
    end
  end
end