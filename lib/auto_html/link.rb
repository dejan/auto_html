require 'uri'
require 'rinku'
require 'rexml/document'

module AutoHtml
  # Link filter
  class Link
    def initialize(target: nil, rel: nil)
      @target = target
      @rel = rel
    end

    def call(text)
      Rinku.auto_link(text, :all, attributes)
    end

    private

    def attributes
      [target_attr, rel_attr].compact.join(' ') unless [target_attr, rel_attr].compact.empty?
    end

    def rel_attr
      %(rel="#{@rel}") if @rel
    end

    def target_attr
      %(target="#{@target}") if @target
    end
  end
end
