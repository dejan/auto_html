require 'tag_helper'

module AutoHtml
  # Credit: https://github.com/rails/rails/blob/0e50b7bdf4c0f789db37e22dc45c52b082f674b4/actionview/lib/action_view/helpers/text_helper.rb#L283
  class SimpleFormat < Filter
    def call(text)
      html_options = options.fetch(:html_options, {})
      wrapper_tag  = options.fetch(:wrapper_tag, :p)

      paragraphs = split_paragraphs(text)
      if paragraphs.empty?
        tag(wrapper_tag, html_options) { '' }
      else
        paragraphs.map! do |paragraph|
          tag(wrapper_tag, html_options) { paragraph }
        end.join("\n\n")
      end
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
