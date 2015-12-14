require 'tag_helper'

module AutoHtml
  # SimpleFormat filter
  class SimpleFormat
    def call(text)
      paragraphs = split_paragraphs(text)
      paragraphs.map! do |paragraph|
        TagHelper.tag(:p) { paragraph }
      end.join("\n\n")
    end

    private

    def split_paragraphs(text)
      return [] if text.nil? || text.empty?
      text.to_s.gsub(/\r\n?/, "\n").split(/\n\n+/).map! do |t|
        t.gsub!(/([^\n]\n)(?=[^\n])/, '\1<br />') || t
      end
    end
  end
end
