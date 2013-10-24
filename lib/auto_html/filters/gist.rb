AutoHtml.add_filter(:gist).with({}) do |text, options|
  # E.g. https://gist.github.com/account_name/hash_id
  regex = /https:\/\/gist\.github\.com\/(\w+)\/(\w+)/
  text.gsub(regex) do
    gist_account = $1
    gist_id = $2
    %{<script src="https://gist.github.com/#{gist_account}/#{gist_id}.js"></script>}
  end
end

