module AutoHtmlFor

  # default options that can be overridden on the global level
  @@auto_html_for_options = {
    :htmlized_attribute_suffix => '_html'
  }
  mattr_reader :auto_html_for_options

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def auto_html_for(raw_attrs, &proc)
      include AutoHtmlFor::InstanceMethods

      suffix =  AutoHtmlFor.auto_html_for_options[:htmlized_attribute_suffix]
      ([raw_attrs].flatten.map { |a| "#{a}#{suffix}" } - self.column_names).each do |missing_cache_column|
        attr_accessor missing_cache_column
      end
      [raw_attrs].flatten.each do |raw_attr|
        define_method("#{raw_attr}=") do |val|
          self[raw_attr] = val
          result = auto_html(val, &proc)
          if result.respond_to?(:html_safe)
            result = result.html_safe 
          end
          self.send("#{raw_attr}#{suffix}=", result)
          val
        end
      end

    end
  end

  module InstanceMethods
    include AutoHtml
  end
end


