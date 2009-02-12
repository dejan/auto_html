require File.join(File.dirname(__FILE__), 'filter')
require File.join(File.dirname(__FILE__), 'builder')

module AutoHtml
  def self.add_filter(name, &block)
    AutoHtml::Builder.add_filter(name, &block)
  end

  def auto_html(raw, &proc)
    builder = Builder.new(raw)
    builder.instance_eval(&proc)
  end
end

# Register built-in filters
#
Dir["#{File.join(File.dirname(__FILE__), 'filters')}/**/*"].each do |filter|
  require "#{filter}"
end
