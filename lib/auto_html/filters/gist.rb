AutoHtml.add_filter(:gist).with({}) do |text, options|
  # E.g. https://gist.github.com/roblabla/035c1a61d434208d5c14
  # Must become <script src="https://gist.github.com/roblabla/035c1a61d434208d5c14.js"></script>
  regex = %r{https?://gist\.github\.com/([\w/]+)}
  text.gsub(regex) do
    gist_id = $1
    %{<script type="text/javascript" src="https://gist.github.com/#{gist_id}.js"></script>}
  end
end
