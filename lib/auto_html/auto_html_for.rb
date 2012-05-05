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
      auto_html_for_columns = [raw_attrs].flatten.map { |a| "#{a}#{suffix}" }
      missing_cache_columns =  auto_html_for_columns - self.column_names
      missing_cache_columns.each do |attr|
        attr_accessor attr
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


