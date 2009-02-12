module AutoHtml
  class Builder

    @@filters = {}

    def initialize(text)
      @text = text.dup
    end

    def self.add_filter(name, &block)
      filter = Filter.new(block)
      @@filters.merge!(name => filter)
      src = %|
        def #{name}(options = {})
          @text = @@filters["#{name}".to_sym].apply(@text, options)
        end
      |
      class_eval src, __FILE__, __LINE__
      filter
    end
  end
end
