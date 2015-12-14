require 'redcarpet'

module AutoHtml
  # Markdown filter
  class Markdown
    def initialize
      render = Redcarpet::Render::HTML
      @markdown = Redcarpet::Markdown.new(render)
    end

    def call(text)
      @markdown.render(text)
    end
  end
end
