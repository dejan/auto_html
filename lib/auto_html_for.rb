module AutoHtmlFor

  # default options that can be overridden on the global level
  @@options = {
    :htmlized_attribute_suffix => '_html'
  }
  mattr_reader :options

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def auto_html_for(raw_attr, filters)
      include AutoHtmlFor::InstanceMethods
      before_save :auto_html_prepare

      define_method("auto_html_prepare") do
        self.send(raw_attr.to_s + AutoHtmlFor.options[:htmlized_attribute_suffix] + "=", 
          auto_html(self.send(raw_attr), filters))
      end
    end
  end

  module InstanceMethods
    include AutoHtml
  end
end