require 'action_view'

module AutoHtml
  module Filters
    module Link
      include ActionView::Helpers::TextHelper
      include ActionView::Helpers::TagHelper
    end
  end
end