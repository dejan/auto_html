require 'tag_helper'
require 'gemoji'

module AutoHtml
  # Emoji filter
  class Emoji
    def initialize(asset_root: '/images', width: 20, height: 20)
      @asset_root = asset_root
      @width = width
      @height = height
    end

    def call(text)
      text.gsub(emoji_pattern) do
        name = Regexp.last_match(1)
        alt = ":#{name}:"
        html_options = {
          src: emoji_url(name),
          class: 'emoji',
          title: alt,
          alt: alt,
          height: @width,
          witdh: @height,
          align: 'absmiddle'
        }
        TagHelper.tag(:img, html_options)
      end
    end

    private

    def emoji_url(name)
      File.join(@asset_root, asset_path(name))
    end

    def asset_path(name)
      File.join('emoji', emoji_filename(name))
    end

    def self.emoji_pattern
      @emoji_pattern ||=
        /:(#{emoji_names.map { |name| Regexp.escape(name) }.join('|')}):/
    end

    def emoji_pattern
      self.class.emoji_pattern
    end

    def self.emoji_names
      ::Emoji.all.map(&:aliases).flatten.sort
    end

    def emoji_filename(name)
      ::Emoji.find_by_alias(name).image_filename
    end
  end
end
