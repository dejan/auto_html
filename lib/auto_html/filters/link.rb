require 'uri'
require 'rinku'
require 'rexml/document'

module AutoHtml
  # Link filter
  class Link < Filter
    def call(text)
      Rinku.auto_link(text, :all, attributes)
    end

    private

    def attributes
      Array(options)
        .reject { |_, v| v.nil? }
        .map { |k, v| %(#{k}="#{REXML::Text.normalize(v)}") }
        .join(' ')
    end
  end
end
