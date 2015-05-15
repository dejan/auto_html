AutoHtml.add_filter(:gist).with({}) do |text, options|

  # E.g.
  #
  #   Gist id: https://gist.github.com/1710276
  #   Username plus id: https://gist.github.com/toctan/c9d3677da5aa021b5c03
  #
  regex = %r{https?:\/\/gist\.github\.com\/(\w+\/)?(\w+)}
  text.gsub(regex) do
    gist_id = $2
    %{<script src="https://gist.github.com/#{gist_id}.js"></script>}
  end
end
