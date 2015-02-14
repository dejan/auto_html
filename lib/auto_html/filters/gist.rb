module AutoHtml
  # Gist filter
  class Gist < Filter
    def call(text)
      regex = %r{https?://gist\.github\.com/(\w+/)?(\d+)}
      text.gsub(regex) do
        gist_id = Regexp.last_match(2)
        tag(:script, type: 'text/javascript', src: gist_url(gist_id)) { '' }
      end
    end

    private

    def gist_url(id)
      "https://gist.github.com/#{id}.js"
    end
  end
end
