require 'net/http'
require 'json'

AutoHtml.add_filter(:tweets).with(:align => nil, :omit_script => true, :lang => "en") do |text, options|
  regex = /http(s)?:\/\/(www.)?twitter\.com\/([A-Za-z0-9._%-]*)\/status(es)?\/([0-9]*)(\&\S+)?|\[tweet http(s)?:\/\/(www.)?twitter\.com\/([A-Za-z0-9._%-]*)\/status(es)?\/([0-9]*)\]/
  text.gsub(regex) do
    html = nil
    tweet_id = $5 || $11
    align = options[:align] || nil
    omit_script = options[:omit_script]
    lang = options[:lang]
    api_url = "https://api.twitter.com/1/statuses/oembed.json?id=#{tweet_id}&omit_script=#{omit_script}&align=#{align}&lang=#{lang}"
    begin
      uri = URI(api_url)
      response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https'){ |http| http.request Net::HTTP::Get.new(uri.request_uri) }
      json = JSON.parse(response.read_body)
      html = json["html"]
    rescue Exception => e
      puts "Error in auto_html/tweets# --> #{e.inspect}"
    end
    html
  end
end
