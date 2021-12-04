# frozen_string_literal: true

require 'gemoji'

module AutoHtml
  # Emoji filter
  class Emoji
    def call(text)
      text.gsub(self.class.emoji_pattern) do
        name = Regexp.last_match(1)
        ::Emoji.find_by_alias(name).raw
      end
    end

    def self.emoji_pattern
      @emoji_pattern ||=
        /:(#{emoji_names.map { |name| Regexp.escape(name) }.join('|')}):/
    end

    def self.emoji_names
      ::Emoji.all.map(&:aliases).flatten.sort
    end
  end
end
