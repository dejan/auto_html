# Rake task for rebuilding cached in DB auto_html columns values
# Usage: rake auto_html:rebuild CLASS=[your model]
# Where [your model] is the name of model which contains auto_html_for columns

module AutoHtml
  module Task
    def self.obtain_class
      class_name = ENV['CLASS'] || ENV['class']
      raise "Must specify CLASS" unless class_name
      class_name.constantize
    end
  end
end

namespace :auto_html do
  desc "Rebuild auto_html columns"
  task :rebuild => :environment do
    klass = AutoHtml::Task.obtain_class
    i = 0
    auto_html_fields = []
    klass.find_each do |item|
      unless auto_html_fields.any?
        auto_html_methods = item.methods.select { |m| m=~/^auto_html_prepare_/ }
        auto_html_methods.each do |method|
          auto_html_fields << method
        end
      end
      
      auto_html_fields.each do |field|
        item.send(field)
      end
      
      item.save
      i += 1
    end
    puts "Done! Processed #{pluralize(i, 'item')}."
  end
end