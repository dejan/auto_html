require 'action_view'

AutoHtml::Builder.add_filter(:link).with(:html_options => {}) do |text, options|

  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::TagHelper

  auto_link(text, :all, options[:html_options])
end

