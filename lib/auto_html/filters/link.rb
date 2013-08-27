AutoHtml.add_filter(:link).with({}) do |text, options|
  require 'rinku'
  require 'rexml/document'

  attributes = Array(options).reject { |k,v| v.nil? }.map { |k, v| %{#{k}="#{REXML::Text::normalize(v)}"} }.join(' ')
  Rinku.auto_link(text, :all, attributes)
end
