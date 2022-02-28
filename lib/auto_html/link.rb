# frozen_string_literal: true

require 'uri'
require 'rinku'
require 'rexml/document'

module AutoHtml
  # Link filter
  class Link
    def initialize(target: nil, rel: nil, short_domains: false)
      @target = target
      @rel = rel
      @short_domains = short_domains
    end

    def call(text)
      Rinku.auto_link(text, :all, attributes, nil, flags)
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

    def flags
      @short_domains ? Rinku::AUTOLINK_SHORT_DOMAINS : 0
    end
  end
end
