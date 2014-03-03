AutoHtml.add_filter(:gist).with({}) do |text, options|
  # E.g. https://gist.github.com/1710276
  regex = %r{https?://gist\.github\.com/(\w+/)?(\d+)}
  text.gsub(regex) do
    gist_id = $2
    %{<script type="text/javascript" src="https://gist.github.com/#{gist_id}.js"></script>}
  end
end
