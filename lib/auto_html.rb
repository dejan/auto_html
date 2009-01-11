require File.dirname(__FILE__) + '/auto_html/filters/link'
require File.dirname(__FILE__) + '/auto_html/filters/image'
require File.dirname(__FILE__) + '/auto_html/filters/youtube'
require File.dirname(__FILE__) + '/auto_html/filters/deezer'

module AutoHtml
  
  # default options that can be overridden on the global level
  @@options = {
    :token_match_regexp => ActionView::Helpers::TextHelper::AUTO_LINK_RE,
    :htmlized_attribute_suffix => '_html'
  }
  mattr_reader :options
  
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def auto_html(raw_attrs, filters = [:image, :youtube, :link])
      include AutoHtml::InstanceMethods
      before_save :auto_html_prepare
      
      write_inheritable_attribute :auto_html_filters, filters
      class_inheritable_reader    :auto_html_filters
      
      define_method("auto_html_prepare") do
        raw_attrs = [raw_attrs] unless raw_attrs.respond_to?(:each)
        raw_attrs.each do |raw_attr|
          self.send(raw_attr.to_s + AutoHtml.options[:htmlized_attribute_suffix] + "=", 
            do_auto_html(self.send(raw_attr)))
        end
      end
    end
  end

  module InstanceMethods
    include Filters
    
    def do_auto_html(raw_value)
      simple_format(html_escape(raw_value).gsub(AutoHtml.options[:token_match_regexp]) { |url| transform(url) || url })
    end

    def transform(url)
      filter = auto_html_filters.detect { |filter| send("auto_html_match_#{filter}", url) }
      filter && send("auto_html_transform_#{filter}", url)
    end
    
    def html_escape(s)
      html_escape => { '&' => '&amp;', '"' => '&quot;', '>' => '&gt;', '<' => '&lt;' }
      s.to_s.gsub(/[&\"><]/) { |special| html_escape[special] }
    end
  end
end