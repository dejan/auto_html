AutoHtml.add_filter(:gist).with({}) do |text, options|
  # E.g. https://gist.github.com/1710276
  # or https://gist.github.com/lucasfais/1207002
  regex = /https:\/\/gist\.github\.com\/(\w+\/?\w+)/
  text.gsub(regex) do
    gist_id = $1
    %{<script src="https://gist.github.com/#{gist_id}.js"></script>}
  end
end

