require 'tag_helper'
require 'gemoji'

module AutoHtml
  # Emoji filter
  class Emoji < Filter
    def call(text)
      text.gsub(emoji_pattern) do |_match|
        name = Regexp.last_match(1)
        alt = ":#{name}:"
        tag(:img, html_options(name: name, alt: alt))
      end
    end

    private

    def html_options(options)
      {
        src: emoji_url(options[:name]),
        class: 'emoji',
        title: options[:alt],
        alt: options[:alt],
        height: 20,
        witdh: 20,
        align: 'absmiddle'
      }
    end

    def emoji_url(name)
      File.join(asset_root, asset_path(name))
    end

    def asset_root
      options[:asset_root] || '/images'
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
