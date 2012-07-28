require 'auto_html/task'

# Rake task for rebuilding cached in DB auto_html columns values
# Usage: rake auto_html:rebuild CLASS=[your model]
# Where [your model] is the name of model which contains auto_html_for columns

namespace :auto_html do
  desc "Rebuild auto_html columns"
  task :rebuild => :environment do

    klass  = AutoHtml::Task.obtain_class.constantize
    suffix = AutoHtmlFor.auto_html_for_options[:htmlized_attribute_suffix]
    column_names = klass.respond_to?(:column_names) ? klass.column_names : klass.fields.keys
    observed_attributes = column_names.select { |c| c=~/#{suffix}$/ }.map { |c| c.gsub(/#{suffix}$/, '')}

    i = 0
    klass.find_each do |item|
      observed_attributes.each do |field|
        item.send("#{field}=", item.send(field))
      end
      item.save
      i += 1
    end

    puts "Done! Processed #{i} items."
  end
end