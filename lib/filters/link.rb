require 'action_view'

AutoHtml.register_filter(:link) do |text|

  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::TagHelper

  auto_link(text, :all, :rel => "nofollow", :target => '_blank')
end

