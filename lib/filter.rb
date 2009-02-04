module AutoHtml
  class Filter
    attr_accessor :regexp, :block
    
    def initialize(regexp, block)
      @regexp = regexp
      @block = block
    end
    
    def apply(text)
      if regexp
        text.gsub(regexp) do |match|
          block.call(match)
        end
      else
        block.call(text.dup)
      end
    end
    
    # posible solution for tweaking options. Example:
    #
    #   AutoHtml.filters[:youtube].tweak({:width => 300, :height => 200})
    #
    # def tweak
    # end
  end
end