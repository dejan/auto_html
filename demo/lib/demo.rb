# frozen_string_literal: true

require 'roda'
require 'auto_html'

# Demo app for auto_html
class Demo < Roda
  plugin :render

  FILTERS = {
    'escape' => AutoHtml::HtmlEscape.new,
    'simple_format' => AutoHtml::SimpleFormat.new,
    'link' => AutoHtml::Link.new,
    'image' => AutoHtml::Image.new,
    'emoji' => AutoHtml::Emoji.new,
  }.freeze

  route do |r|
    r.root do
      render('demo')
    end

    r.post 'auto-html' do
      filters = FILTERS.values_at(*r.params['filters']).compact
      pipeline = AutoHtml::Pipeline.new(*filters)
      pipeline.call(r.params['text'])
    end
  end
end
