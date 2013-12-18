require 'rails'

require 'active_support/core_ext/module/attribute_accessors' if Rails::VERSION::MAJOR >= 4

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

      if defined?(ActiveRecord) == "constant"
        return unless ActiveRecord::Base.connection.table_exists? self.table_name
      end

      suffix =  AutoHtmlFor.auto_html_for_options[:htmlized_attribute_suffix]
      auto_html_for_columns = [raw_attrs].flatten.map { |a| "#{a}#{suffix}" }
      
      # Needed for Mongoid
      column_names = self.respond_to?(:column_names) ? self.column_names : fields.keys
      
      missing_cache_columns =  auto_html_for_columns - column_names
      missing_cache_columns.each do |missing_cache_column|
        raw_attr = missing_cache_column.gsub(suffix, '')
        define_method(missing_cache_column) do
          val = self[raw_attr] || self.send(raw_attr.to_sym)
          auto_html(val, &proc)
        end
      end
      
      cache_columns = auto_html_for_columns - missing_cache_columns
      cache_columns.each do |cache_column|
        raw_attr = cache_column.gsub(suffix, '')
        define_method("#{raw_attr}=") do |val|
          self[raw_attr] = val
          result = auto_html(val, &proc)
          self.send("#{cache_column}=", result)
          val
        end
        
        define_method(cache_column) do
          result = self[cache_column]
          result.respond_to?(:html_safe) ? result.html_safe : result
        end
      end

    end
  end

  module InstanceMethods
    include AutoHtml
  end
end


