require File.dirname(__FILE__) + '/auto_html/filters/link'
require File.dirname(__FILE__) + '/auto_html/filters/image'
require File.dirname(__FILE__) + '/auto_html/filters/youtube'

module AutoHtml
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def auto_html(raw_attr, htmlized_attr, filters = [:image, :youtube, :link])
      include AutoHtml::InstanceMethods
      before_save :auto_html_prepare
      
      write_inheritable_attribute :auto_html_filters, filters
      class_inheritable_reader    :auto_html_filters
      
      class_eval %{
        def auto_html_prepare
          self.send("#{htmlized_attr}=", do_auto_html(self.send("#{raw_attr}")))
        end
      }
    end
  end

  module InstanceMethods
    include Filters::Link, Filters::Image, Filters::Youtube

    def do_auto_html(raw_value)
      simple_format(raw_value.gsub(AUTO_LINK_RE) { |url| transform(url) })
    end

    def transform(url)
      (auto_html_filters.include?(:image)     && auto_image(url))   || 
        (auto_html_filters.include?(:youtube) && auto_youtube(url)) ||
          (auto_html_filters.include?(:link)  && auto_link(url, :all, :rel => "nofollow", :target => '_blank')) ||
            url
    end
  end
end