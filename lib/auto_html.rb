require File.join(File.dirname(__FILE__), 'filter')

module AutoHtml
  @@filters = {}
  # mattr_reader :filters

  def self.register_filter(name, regexp = nil, &block)
    @@filters.merge!(name => Filter.new(regexp, block))
  end

  def auto_html(raw, filters)
    [filters].flatten.inject(raw) do |text, filter_name|
      filter = @@filters[filter_name]
      filter.apply(text)
    end
  end
end

# Register built-in filters
#
Dir["#{File.join(File.dirname(__FILE__), 'filters')}/**/*"].each do |filter|
  require "#{filter}"
end
