require 'action_view'

module AutoHtml
  module Filters
    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::TagHelper
    
    def auto_html_match_link(url)
      true
    end
    
    def auto_html_transform_link(url)
      auto_link(url, :all, :rel => "nofollow", :target => '_blank')
    end
  end
end