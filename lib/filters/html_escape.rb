AutoHtml::Filter.create(:html_escape) do |text|
  HTML_ESCAPE = { '&' => '&amp;',  '>' => '&gt;',   '<' => '&lt;', '"' => '&quot;' }
  text.to_s.gsub(/[&"><]/) { |special| HTML_ESCAPE[special] }
end
