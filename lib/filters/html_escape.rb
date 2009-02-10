AutoHtml.add_filter(:html_escape).with(
  :map => { 
    '&' => '&amp;',  
    '>' => '&gt;',
    '<' => '&lt;',
    '"' => '&quot;' }) do |text, options|

  text.to_s.gsub(/[&"><]/) { |special| options[:map][special] }
end
