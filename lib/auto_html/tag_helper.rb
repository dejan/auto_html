# frozen_string_literal: true

module AutoHtml
  # XHTML tags builder
  module TagHelper
    def tag(tag_name, attrs = {})
      if block_given?
        content_tag(tag_name, yield, attrs)
      else
        unary_tag(tag_name, attrs)
      end
    end

    private

    def unary_tag(tag_name, attrs = {})
      "<#{tag_and_attributes(tag_name, tag_attributes(attrs))} />"
    end

    def content_tag(tag_name, value, attrs = {})
      start_tag = "<#{tag_and_attributes(tag_name, tag_attributes(attrs))}>"
      end_tag   = "</#{tag_name}>"
      [start_tag, value, end_tag].join
    end

    def tag_and_attributes(tag_name, attributes)
      attributes.empty? ? tag_name : "#{tag_name} #{attributes}"
    end

    def tag_attributes(hash)
      hash.compact
          .to_a
          .map { |k, v| %(#{k}="#{v}") }.join(' ')
    end

    extend self
  end
end
