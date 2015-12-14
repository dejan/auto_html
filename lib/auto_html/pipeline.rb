module AutoHtml
  # Applies collection of filters to a text
  class Pipeline
    def initialize(*filters)
      @filters = filters.flatten
    end

    def call(text)
      return '' if text.nil? || text.empty?
      @filters.inject(text) do |content, filter|
        filter.call(content)
      end
    end
  end
end
